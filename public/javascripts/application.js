// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function init_sliders(min_v, max_v, min, max){
  min = new Control.Slider($('rate_slider').down('.handler_min'), $('rate_slider'), {
      range: $R(min_v, max_v-1),
      sliderValue: min,
      onSlide: function(value) {
     if (value+1 <  $('price_max').value) {
          $('price_min').value = value.toFixed();
      $('rate_value_min').innerHTML = value.toFixed();
     } else {
          $('price_min').value = value.toFixed();
      $('rate_value_min').innerHTML = value.toFixed();
        $('price_max').value = (value+1).toFixed();
          $('rate_value_max').innerHTML = (value+1).toFixed();
      max.setValue((value+1).toFixed());
    }
      }
    });
   max =  new Control.Slider($('rate_slider').down('.handler_max'), $('rate_slider'), {
      range: $R(min_v+1, max_v),
      sliderValue: max,
      onSlide: function(value) {
     if (value-1 >  $('price_min').value) {
        $('price_max').value = value.toFixed();
          $('rate_value_max').innerHTML = value.toFixed();
     } else {
        $('price_max').value = value.toFixed();
          $('rate_value_max').innerHTML = value.toFixed();
      $('price_min').value = (value-1).toFixed();
          $('rate_value_min').innerHTML = (value-1).toFixed();
      min.setValue((value-1).toFixed());
    }
      }
    });
}

function MM_jumpMenu(targ,selObj,restore){
	eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	if (restore) selObj.selectedIndex=0;
}

// google_ad_client = "ca-pub-9814004731260896";
// /* My-My Top Right Ad */
// google_ad_slot = "8365127755";
// google_ad_width = 300;
// google_ad_height = 250;
