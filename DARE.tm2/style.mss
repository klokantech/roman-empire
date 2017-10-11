Map {
  background-color: #fff;
}

#provinces[zoom>=4][zoom<=7]  {
  line-width: 1.5;
  line-color: rgba(60, 35, 63, 0.91);
}

#provinces_label[zoom>=4][zoom<=6] {
  text-name: '[name]';
  text-face-name: 'Source Sans Pro Semibold';
  text-fill:rgba(7, 7, 7, 0.99);
  text-halo-radius: 1.5;

  [zoom>=4] { text-size: 10; }
  [zoom<=6] { text-size: 12; }
  }

#roads_low[major_or_m='1'][zoom>=4] {
  line-width: 1.5;
  line-color: rgba(236, 77, 37, 0.78);
}
  [major_or_m='0'][zoom>=9] {
  line-width: 1;
  line-color: rgba(236, 164, 145, 0.78);
  
  }
  

#roads_high[zoom>=7] {
  line-width: 3;
  line-color: rgba(20, 15, 13, 0.78);
  text-name: '[name]';
  text-face-name: 'Source Sans Pro Semibold';
  text-fill:rgba(7, 7, 7, 0.99);
  text-halo-radius: 1.5;
  [zoom=4]{ text-size: 12; }
  [zoom<=6]{ text-size: 16; } 
}
  

//how the places should be named. 
//makes the point of the place dissapear for the zoom the labels applies.
#places {
  [major=1][zoom>=7] {
    text-name: '[latin]';
    text-size: 10;
    text-halo-radius: 1.5;
    text-face-name: 'Roboto Bold';
    text-fill:rgba(7, 7, 7, 0.70); 
    text-placement: point;
    text-vertical-alignment: auto;
    text-align: left;
    text-dx: 8;
    text-dy: 8;
    text-placement-type: simple;
    text-transform: uppercase;
  }
  [major=1][zoom>=10] {
    text-name: '[latin]';
    text-size: 12;
    text-halo-radius: 1.5;
    text-face-name: 'Roboto Bold';
    text-fill:rgba(7, 7, 7, 0.70); 
    text-placement: point;
    text-vertical-alignment: auto;
    text-align: left;
    text-dx: 8;
    text-dy: 8;
    text-placement-type: simple;
    text-transform: uppercase;
  }
  [major=2][zoom>=8] {
    text-name: '[latin]';
    text-size: 10;
    text-halo-radius: 1.5;
    text-face-name: 'Roboto Bold';
    text-fill:rgba(7, 7, 7, 0.70); 
    text-placement: point;
    text-vertical-alignment: auto;
    text-align: left;
    text-dx: 8;
    text-dy: 8;
    text-placement-type: simple;
  }
   [major=3][zoom>=9] {
    text-name: '[latin]';
    text-size: 12;
    text-halo-radius: 1.2;
    text-face-name: 'Roboto Medium';
    text-fill:brown; 
    text-placement: point;
    text-vertical-alignment: auto;
    text-align: left;
    text-dx: 8;
    text-dy: 8;
    text-placement-type: simple;
 }
  [major=4][zoom>=9] {
    text-name: '[latin]';
    text-size: 12;
    text-halo-radius: 1.2;
    text-face-name: 'Roboto Medium';
    text-fill:brown; 
    text-placement: point;
    text-vertical-alignment: auto;
    text-align: center;
    text-dx: 10;
    text-dy: 10;
    text-placement-type: simple;
  }
  [major=0][zoom>=8] {
    text-name: '[latin]';
    text-size: 10;
    text-halo-radius: 1.2;
    text-face-name: 'Roboto Medium';
    text-fill:rgba(7, 7, 7, 0.70); 
    text-placement: point;
    text-vertical-alignment: auto;
    text-align: left;
    text-dx: 8;
    text-dy: 8;
    text-placement-type: simple;
  }
  [latin=''][zoom>=10] {
    text-name: '[modern]';
    text-size: 10;
    text-halo-radius: 1.2;
    text-face-name: 'Roboto Italic';
    text-fill:rgba(7, 7, 7, 0.70); 
    text-placement: point;
    text-vertical-alignment: auto;
    text-align: left;
    text-dx: 8;
    text-dy: 8;
    text-placement-type: simple;
  }
    
    //road or costal station label 
    [type='16'][zoom>=10] {
      text-name: '[latin]';
      text-size: 11;
      text-face-name: 'Clan Offc Pro Narrow News Italic';
      text-fill:rgba(207, 24, 24, 0.99);  
      text-halo-radius: 1.5;
      text-dy: 3;
      text-dx: 3;
    }

 }
//when we find out how to display both symbol and label we add the 
//other "place-label-definitions" here. 
  




  


  
//very many different types of places, defined by the attriute type. 
#places {
  //major settlements
  [type='11'][zoom>=6] {
    marker-line-color: rgba(0, 0, 0, 0.98);
    marker-fill: rgba(255, 255, 255, 0.98); 
    marker-width: 6;
    marker-line-width: 1.5;
    [zoom>=8] { marker-width: 11; }
  }
  
  //major fort
  [type='17'][zoom>=6] {
    marker-file: url("square.svg");
    marker-width: 12;
    marker-height: 15;
    [zoom<=9] { marker-width: 9; marker-height: 11;}
  }
  
  //minor fort
  [type='18'][zoom>=8] {
    marker-file: url("square.svg");  
    //make better distinction betweem different levels of "fort"?
    marker-opacity: 0.8;
    marker-width: 10;
    marker-height: 13;
    [zoom<=9] { marker-width: 5; marker-height: 6;}
  }


  [type='12'][zoom>=8],
  [type='13'][zoom>=8] {
    marker-line-color: rgb(12, 3, 2);
    marker-width: 6;
    marker-line-width: 1;
    marker-fill: rgba(245, 245, 245, 0.99);
  }
  
  //road or costal station --> maybe no symol necessary
  [type='16'][zoom>=8] {
    marker-file: url("diamond.svg");
    marker-width: 10;
    marker-height: 10;
    [zoom>=10] { marker-width: 15; marker-height: 15;}
  }
  
  //Iron Age (Celtic) Oppidum
  [type='31'][zoom>=9] {
    marker-line-color: rgb(156, 33, 20);
    marker-width: 7;
    marker-fill: rgb(156, 33, 20);
  }
  
  //late Roman oppodium
  [type='35'][zoom>=9] {
    marker-line-color: rgb(0, 0, 0);
    marker-width: 7;
    marker-fill: rgb(0, 0, 0);
  }
  
  //Bath
  [type='66'][zoom>=9] {
    marker-file: url("bath2.svg");
    marker-width: 15;
    marker-height: 15;
    [zoom>=10] { marker-width: 20; marker-height: 20;}
  }
  
  //Sanctuary or temple
  [type='61'][zoom>=9] {
    marker-file: url("star.svg");
    marker-width: 15;
    marker-height: 15;
  }
      
  //fortel/tower
  [type='53'][zoom>=10] {
    marker-file: url("square.svg");
    //make better distinction betweem different levels of "fort"?
    marker-opacity: 0.6;
    marker-width: 4;
    marker-height: 5;
  }
  
  //Tumulus
  [type='32'][zoom>=10] {
    marker-file: url("tumulus.svg");
    marker-width: 15;
    marker-height: 15;
  }
  
  //cemetery
  [type='63'][zoom>=10] {
    marker-file: url("cemetery.svg");
    marker-width: 9;
    marker-height: 12;
  }
  
  //Monastery
  [type='21'][zoom>=10],
  [type='21'][zoom>=10] {
    marker-file: url("monastery.svg");
    marker-width: 13;
    marker-height: 17;
  }
  
  //villa
  [type='14'][zoom>=10] {
    marker-file: url("villa.svg");
    marker-width: 13;
    marker-height: 8;
  }
  
  //mine
  [type='57'][zoom>=10] {
    marker-file: url("mine.svg");
    marker-width: 15;
    marker-height: 15;
  }
  
  //pass
  [type='49'][zoom>=10] {
    marker-file: url("pass.svg");
    marker-width: 15;
    marker-height: 20;
  }
  
  //bridge
  [type='49'][zoom>=10] {
    marker-file: url("bridge.svg");
    marker-width: 20;
    marker-height: 8;
  }
  
  //Road/milestone
  //Aqueduct/dam/cistern/spring
  //Monument
  [type='55'][zoom>=10],
  [type='52'][zoom>=10],
  [type='64'][zoom>=10] {
    marker-file: url("square.svg");
    marker-width: 5;
    marker-height: 6;
  }


}

