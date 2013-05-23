$(document).ready(function() {
  $('.container form button[name="postvote"]').on('click', function(event) {
    event.preventDefault();
    var box = $(this).val();
    $.ajax({
      type: 'post',
      url: $('form[name="postvoter"]').attr('action'),
      data: ("postvote=" + box)
      }).done(function(data) {
        $('.container form[name="postvoter"]').toggle("slow");
        var score = parseInt($('.post-title span').text());
        $('.post-title span').text(score + data.vote);
      });
  });
  $('button[name="commentvote"]').on('click', function(event) {
    event.preventDefault();
    var box = $(this).val();
    var comment = $(this).attr('label');
    $.ajax({
      type: 'post',
      url: $(this).parent().attr('action'),
      data: ("commentvote=" + box)
      }).done(function(data) {
        $('button[label="' + comment + '"]').parent().toggle("slow");
        var score = parseInt($('button[label="' + comment + '"]').parent().parent().find('span').text());
        $('button[label="' + comment + '"]').parent().parent().find('span').text(score + data.vote);
      });
  });
});
