
$(document).ready(function() {

  $('#register-employer').click(function() {
    $('#employer-form').css('display', 'block');
    $('#register-button-container').fadeOut('fast', function() {
      $('#employer-form-part-1').fadeIn('fast');
    });
  });

  $('#register-employer-next-1').click(function() {
    $('#employer-form-part-1').fadeOut('fast', function() {
    $('#employer-form-part-2').fadeIn('fast') });
  });

  $('#register-employer-next-2').click(function() {
    $('#employer-form-part-2').fadeOut('fast', function() {
    $('#employer-form-part-3').fadeIn('fast') });
  });

  $('#register-employer-next-3').click(function() {
    $('#employer-form-part-3').fadeOut('fast', function() {
    $('#employer-form-part-4').fadeIn('fast') });
  });

  $('#search-jobs').keyup(function() {
    doAjaxSearch();
  });

  $('#search-type input[type="radio"]').change(function() {
    doAjaxSearch();
  });

  $('.search-result').click(function() {
    $('.search-result-more',this).show();
  });

  $('#counties-select').change(function() {
    $.getJSON('/api/municipality/by_county.json/' + $('option:selected', this).val(), function(data) {
      $('#municipalities-select').empty();
      $.each(data, function(i, item) {
        $('#municipalities-select').append('<option>' + item.municipality.name);
      });
    });
  });

  $('#post-code').keyup(function() {

    var postcode = $(this);

    postcode.css('background-color', 'white');    

    if($(this).val().length != 4) return;


    $.getJSON('/api/post_code/info.json/' + $(this).val(), function(data) {

      $('#counties-select').val(data.post_code.county).attr('selected', true);
      $('#counties-select').trigger('change');
      postcode.css('background-color', 'lightgreen');
      //$('#municipalities-select').val(data.post_code.municipality).attr('selected', true);

    });
  });

  var clearMePrevious = '';

  $('.clear-focus').focus(function() {
    if($(this).val()==$(this).attr('title')) {
    previous = $(this).val();
    $(this).val('');
    }
  });

  $('.clear-focus').blur(function() {
    if($(this).val()=='') { $(this).val(previous); }
  });

  $('.badge').badger('ny');

  $('.signup-button').fancybox();
  $('.signin-button').fancybox();

});

function doAjaxSearch() {

  if($('#search-jobs').val().length < 3) return;
  $.getJSON('/job/search.json', $('#search-form').serialize(), function(data) {
    $('#search-jobs-results').empty();
    if(data.length > 0)
      $('#search-jobs-results').append('<div style="margin-bottom: 10px">' + data.length + ' resultat' + (data.length > 1 ? 'er' : ''));

    $.each(data, function(i, item) {
      $('#search-jobs-results').append(
        '<div class="search-result" onclick="toggleSearchMore(this)">'
          + '<span class="search-result-title">' + item.job.title + '</span>' 
          + '<div class="search-result-more" style="display: none">' 
          +   '<div class="search-result-company-name">' + item.job.company_name + '</div>'
          +   '<div class="search-result-description">' + item.job.description + '</div>'
          +   '<div class="search-result-menu"><a href="#">Søk jobben</a> &nbsp; <a href="#">Følg</a></div>'
          + '</div>' + 
        '</div>')
    });
  });
}

function toggleSearchMore(elem) {

  $('.search-result-open').removeClass('search-result-open');
  $(elem).addClass('search-result-open');
  $('.search-result-more:visible').hide('fast')
  $('.search-result-more',elem).show('fast')

}

