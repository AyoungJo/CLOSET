 $( document ).ready( function() {
        var jbOffset = $( '.menu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.menu' ).addClass( 'jbfixed' );
          }
          else {
            $( '.menu' ).removeClass( 'jbfixed' );
          }
        });
      } );