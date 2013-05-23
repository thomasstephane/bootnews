$(document).ready(function() {
  $('button[name="postvote"]').on('click', function(event) {
    event.preventDefault();
    var box = $(this).val();
    $.ajax({
      type: 'post',
      url: $('form[name="postvoter"]').attr('action'),
      data: ("postvote=" + box)
      }).done(function(data) {
        $('form[name="postvoter"]').toggle("slow");
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
      url: $('form[name="commentvoter"]').attr('action'),
      data: ("commentvote=" + box)
      }).done(function(data) {

        $('button[label="' + comment + '"]').parent().toggle("slow");
        var score = parseInt($('button[label="' + comment + '"]').parent().siblings().text());
        $('button[label="' + comment + '"]').parent().siblings().text(score + data.vote);
      });
  });
});
