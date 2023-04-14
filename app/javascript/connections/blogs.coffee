# refactor into javascript

JQuery(document).on 'turbolinks:load', ->
    comments = $('#comments')
    if comments.length > 0 
        App.global_chat = App.cable.subscriptions.create {
            channel: "CommentsChannel"
            blog_id: comments.data('blog-id')
        },
        connected: ->
            # Called when the subscription is ready for use on the server
            console.log 'connected'
        disconnected: ->
            # Called when the subscription has been terminated by the server
            console.log 'disconnected'
        received: (data) ->
            # Called when there's incoming data on the websocket for this channel
            console.log data
            comments.append data['comment']
        send_comment: (comment, blog_id) ->
            @perform 'send_comment', comment: comment, blog_id: blog_id
    $('#new_comment').submit (e) ->
        e.preventDefault()
        $this = $(this)
        textarea = $this.find('#comment_content')
        if $.trim(textarea.val()).length > 0
            App.global_chat.send_comment textarea.val(), comments.data('blog-id')
            textarea.val('')
        return false