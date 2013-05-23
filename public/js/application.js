$(document).ready(function() {
  $('.container form button[name="postvote"]').on('click', function(event) {
    event.preventDefault();
    var vote_val = $(this).val();
    $.ajax({
      type: 'post',
      url: $('form[name="postvoter"]').attr('action'),
      data: ("postvote=" + vote_val)
      }).done(function(data) {
        $('.container form[name="postvoter"]').toggle("slow");
        var score = parseInt($('.post-title span').text());
        $('.post-title span').text(score + data.vote);
      });
  });
  $('button[name="commentvote"]').on('click', function(event) {
    event.preventDefault();
    var vote_val = $(this).val();
    var comment = $(this).attr('label');
    $.ajax({
      type: 'post',
      url: $(this).parent().attr('action'),
      data: ("commentvote=" + vote_val)
      }).done(function(data) {
        $('button[label="' + comment + '"]').parent().toggle("slow");
        var score = parseInt($('button[label="' + comment + '"]').parent().parent().find('span').text());
        $('button[label="' + comment + '"]').parent().parent().find('span').text(score + data.vote);
      });
  });
});
