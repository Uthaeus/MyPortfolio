// convert to ES6

$(document).on('turbolinks:load', function() {
    console.log('blogs.js loaded');
    let comments = $('#comments');
    if (comments.length > 0) {
         App.global_chat = App.cable.subscriptions.create({ channel: 'BlogsChannel', blog_id: comments.data('blog-id') }, {
            received(data) {
                comments.append(data['comment']);
            }
        }, {
            connected() {
                console.log('connected');
            }
        }, {
            disconnected() {
                console.log('disconnected');
            }
        }, {
            send_comment(comment, blog_id) {
                return this.perform('send_comment', {
                    comment: comment,
                    blog_id: blog_id
                });
            }
        });

    }
    $('#comment-submit').on('click', function(e) {
        e.preventDefault();
        let $this = $(this);
        let textarea = $this.find('#comment_content');
        let comment = textarea.val();
        let blog_id = comments.data('blog-id');
        console.log('textarea blogs.js', textarea)
        if (comment != '') {
            App.global_chat.send_comment(comment, blog_id);
            textarea.val('');
        }
        return false;
    });
    
});