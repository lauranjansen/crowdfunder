$(document).ready(function() {
    $('.card').flip({
      axis: 'y',
      trigger: 'hover',
      reverse: true
    });

    $('.back').click(function(e){
      form = $(e.currentTarget).find('.pledge-form');
      form.submit();
    });

    $('.pledge-form').on('submit', function(e){
      e.preventDefault();
      console.log('Working');
    });
  });