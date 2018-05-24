# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready =>
  $('#add-post').on 'ajax:success', (data) ->
    $('#addPostModal').modal('hide')
    post = data.detail[0]
    $('.posts').prepend """
      <div class="post-wrapper col-12 col-md-8 col-lg-6">
        <div class="post-user">
          <h6>@<span class="post-user">#{post.user}</span</h6>
        </div>
        <div class="post">
          <img src="#{post.image}" class="img-fluid img-thumbnail" />
        </div>
        <div class="post-caption">
          <h6 class="mt-2">#{post.caption}</h6>
        </div>
      </div>
    """

  $('#add-post').on 'ajax:error', (data) ->
    error = data.detail[0]
    $('.upload-error').append('File type must be an image and less than 500kb')
