$(document).ready(function() {
    $('.card').flip({
      axis: 'y',
      trigger: 'hover',
      reverse: true
    });

    $('.back').on('click', function(e){
      form = $(e.currentTarget).find('.pledge-form');
      form.submit();
      console.log('Worked');
    });
  });