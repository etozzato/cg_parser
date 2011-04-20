module OpenxHelper

  def x_tag
    zoneid, n = get_tag(@app_name)
    unless zoneid == 'UNDEFINED'
      "<!--/* OpenX Javascript Tag v2.8.7 */-->\n      <script type='text/javascript'><!--//<![CDATA[\n         var m3_u = 'http://www.my-my.us/ad/www/delivery/ajs.php';\n         var m3_r = parseInt(Math.pow(10,16)*Math.random());\n         if (!document.MAX_used) document.MAX_used = ',';\n         document.write (\"<scr\"+\"ipt type='text/javascript' src='\"+m3_u);\n         document.write (\"?zoneid=#{zoneid}&amp;target=_blank\");\n         document.write ('&amp;cb=' + m3_r);\n         if (document.MAX_used != ',') document.write (\"&amp;exclude=\" + document.MAX_used);\n         document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));\n         document.write (\"&amp;loc=\" + escape(window.location));\n         if (document.referrer) document.write (\"&amp;referer=\" + escape(document.referrer));\n         if (document.context) document.write (\"&context=\" + escape(document.context));\n         if (document.mmm_fo) document.write (\"&amp;mmm_fo=1\");\n         document.write (\"'><\/scr\"+\"ipt>\");\n      //]]>\n--></script>\n<noscript><a href='http://www.my-my.us/ad/www/delivery/ck.php?n=#{n}&amp;cb=#{rand(1000)}' target='_blank'><img src='http://www.my-my.us/ad/www/delivery/avw.php?zoneid=#{zoneid}&amp;cb=#{rand(1000)}&amp;n=#{n}' border='0' alt='' /></a></noscript>"
    end
  end

  def get_tag(tag)
    case tag.to_sym
    when :myacura 
      [2,'aa51cffa']
    when :alfaromeo 
      [3,'a9999bca']
    when :myaudi 
      [4,'a6383d3b']
    when :mybmw 
      [5,'abb2824e']
    when :mycadillac 
      [6,'ab8ae395']
    when :mychevrolet 
      [7,'acbf0784']
    when :mychrysler 
      [8,'a8e7e841']
    when :mydodge 
      [9,'a5ec0755']
    when :myferrari 
      [10,'a9032224']
    when :myfiat 
      [11,'a615c520']
    when :myford 
      [12,'ae1eabd2']
    when :mygmc 
      [13,'af062d07']
    when :myhonda 
      [33,'ad4caa17']
    when :myhummer 
      [14,'a2fa986e']
    when :myjaguar 
      [15,'a757edc8']
    when :myjeep 
      [16,'a9be1c10']
    when :mylandrover 
      [17,'a7759e5a']
    when :mylexus 
      [18,'a8ddfd0d']
    when :mylotus 
      [19,'a1995435']
    when :mymaserati 
      [20,'a5ff6bf6']
    when :mymazda 
      [21,'a5178f47']
    when :mymercedesbenz 
      [22,'aade7f5a']
    when :mymini 
      [23,'aabc8e8f']
    when :mymitsubishi 
      [24,'afe0060f']
    when :mynissan 
      [25,'a3bcb41d']
    when :myporsche 
      [26,'a449ff8e']
    when :myrover 
      [27,'aa9ec6fc']
    when :mysaab 
      [28,'a4c171a1']
    when :mysmart 
      [29,'af8d0411']
    when :mysubaru 
      [30,'a3cda1c1']
    when :mytoyota 
      [31,'af212e95']
    when :myvolkswagen 
      [1,'acfa06c7']
    when :myvolvo 
      [32,'a140f26f']
    else 'UNDEFINED'
    end
  end

end