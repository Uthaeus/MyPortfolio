class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 3, maximum: 140 }

  #broadcasts_to ->(comment) { 'comments' }

  after_create_commit { create_broadcast }
  after_update_commit { update_broadcast }
  after_destroy_commit { destroy_broadcast }

  private

  def create_broadcast
    broadcast_prepend_to 'comments', target: 'comments', partial: 'comments/comment', locals: { comment: self }
  end

  def update_broadcast
    broadcast_replace_to 'comments', target: 'comments', partial: 'comments/comment', locals: { comment: self }
  end

  def destroy_broadcast
    broadcast_remove_to 'comments', target: 'comments'
  end
end
