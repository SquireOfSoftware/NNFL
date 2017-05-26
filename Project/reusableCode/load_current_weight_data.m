if exist('current_weight.mat', 'file')
    load('current_weight.mat', 'w', 'wBar', 'cycles');
else
    % interestingly all ones do nothing
    %weight1 = zeros(noOfInputs + 1, 1);
    %currentWeight = processedPatternCollection(1, :)';
    %currentWeight = [currentWeight; 1];
    wBar = [0.103690813000000,0.951948719000000,0.156823380000000,0.479482742000000,0.0880615430000000,0.625975120000000,0.455778214000000,0.993930774000000,0.727576432000000,0.764917566000000,0.890719713000000,0.631272862000000,0.271941387000000,0.527635813000000,0.652926334000000,0.704802261000000,0.538439194000000,0.926953229000000,0.879644115000000,0.892371316000000,0.382715617000000,0.527701649000000,0.0735096140000000,0.529406493000000,0.773205991000000,0.954421868000000,0.151568309000000,0.0750974770000000,0.374972037000000,0.222343091000000,0.744971342000000,0.837747484000000,0.726736008000000,0.590431073000000,0.0930201230000000,0.286436928000000,0.470070731000000,0.0316352580000000,0.154452528000000,0.654181921000000,0.961616746000000,0.151611868000000,0.266105921000000,0.202936601000000,0.550118155000000,0.945279249000000,0.277128692000000,0.479382669000000,0.00468049600000000,0.848831904000000,0.427552583000000,0.316062689000000,0.442705879000000,0.426435669000000,0.944118587000000,0.340081726000000,0.556658775000000,0.0417716990000000,0.0239959640000000,0.722362306000000,0.297416526000000,0.553831531000000,0.0940079410000000,0.197943532000000,0.271261845000000,0.597305388000000,0.678180069000000,0.420447849000000,0.491237867000000,0.149416428000000,0.460040057000000,0.800966321000000,0.870024720000000,0.130261502000000,0.504496314000000,0.249415671000000,0.435594233000000,0.935611092000000,0.986663571000000,0.815304440000000,0.171876921000000,0.939767779000000,0.270336124000000,0.480654128000000,0.426483317000000,0.360064618000000,0.972221824000000,0.110743104000000,0.402970526000000,0.491579721000000,0.944232439000000,0.127875308000000,0.967731838000000,0.933189861000000,0.290878817000000,0.146264976000000,0.873039581000000,0.276045802000000,0.311211717000000,0.0212515190000000,0.844618235000000,0.541754258000000,0.339867504000000,0.914168915000000,0.762850410000000,0.755064180000000,0.851201134000000,0.416881259000000,0.647506228000000,0.359281978000000,0.254214157000000,0.532276505000000,0.0926592210000000,0.0275883350000000,0.616065557000000,0.407673009000000,0.0185933670000000,0.627101522000000,0.0374552130000000,0.0333374400000000,0.911776745000000,0.0358354280000000,0.795941940000000,0.0880322310000000,0.907803707000000,0.785734499000000,0.376511929000000,0.731460200000000,0.427634010000000,0.891905924000000,0.0156574870000000,0.529705274000000,0.638337659000000,0.815680864000000,0.102580522000000,0.866624872000000,0.871645492000000,0.654570741000000,0.998676839000000,0.261390855000000,0.537267085000000,0.340928474000000,0.282144059000000,0.485073982000000,0.390068094000000,0.962687764000000,0.121431932000000,0.510339763000000,0.134232070000000,0.703767557000000,0.192720591000000,0.303745818000000,0.467538551000000,0.644988347000000,0.885789004000000,0.889746896000000,0.262519867000000,0.411480462000000,0.708273785000000,0.651978436000000,0.215197890000000,0.932617029000000,0.619571529000000,0.531974134000000,0.257222297000000,0.444016636000000,0.385990713000000,0.0299371290000000,0.830173375000000,0.663887961000000,0.475027149000000,0.169329613000000,0.845795704000000,0.0466292200000000,0.771655956000000,0.0971319760000000,0.150727602000000,0.887717113000000,0.0816350990000000,0.512456094000000,0.00547914000000000,0.749368883000000,0.529533007000000,0.294577453000000,0.554419711000000,0.866051217000000,0.797484106000000,0.00459092300000000,0.757880527000000,0.915934573000000,0.571860528000000,0.434932672000000,0.858757123000000,0.247335359000000,0.505592749000000,0.706589659000000,0.232083145000000,0.522794654000000,0.537848027000000,0.276681437000000,0.850140810000000,0.120544584000000,0.747718225000000,0.551363931000000,0.116065598000000,0.671816474000000,0.214005771000000,0.868829173000000,0.896202063000000,0.112462747000000,0.212283998000000,0.891385582000000,0.669001188000000,0.930885965000000,0.322246025000000,0.902589328000000,0.344624555000000,0.182566859000000,0.778568491000000,0.971042202000000,0.660257905000000,0.897339603000000,0.406357778000000,0.821957374000000,0.943037461000000,0.559135603000000,0.790322323000000,0.955895333000000,0.254329463000000,0.377884581000000,0.381016926000000,0.0848962240000000,0.519240878000000,0.296185922000000,0.282273831000000,0.296392664000000,0.287875759000000,0.0601388890000000,0.0529089120000000,0.933938351000000,0.0312442990000000,0.371905720000000,0.108802418000000,0.819651147000000,0.206900231000000,0.406256904000000,0.671681210000000,0.205414020000000,0.206939226000000,0.0695978820000000,0.433997984000000,0.910230098000000,0.344062900000000,0.898950436000000,0.823970402000000,0.797249234000000,0.910691919000000,0.621423087000000,0.449404886000000,0.271071134000000,0.438172718000000,0.0456503960000000,0.582320363000000,0.456397454000000,0.477070057000000,0.553944397000000,0.348599269000000,0.551694873000000,0.979037089000000,0.155447588000000,0.00188003500000000,0.512810545000000,0.224852599000000,0.948957532000000,0.0612608090000000,0.131207746000000,0.544645247000000,0.770205982000000,0.385194353000000,0.520292193000000,0.00249610600000000,0.803192296000000,0.899870380000000,0.201996585000000,0.567660592000000,0.801394498000000,0.000612041000000000,0.726994832000000,0.259608846000000,0.840813549000000,0.329304251000000,0.330403005000000,0.471293857000000,0.195728231000000,0.460768012000000,0.965522769000000,0.526829036000000,0.0946266630000000,0.0534556070000000,0.354732440000000;0.805058969000000,0.389821576000000,0.407978163000000,0.692411907000000,0.0307702510000000,0.919167305000000,0.128637029000000,0.136987146000000,0.0739277970000000,0.601289081000000,0.205038138000000,0.927392680000000,0.755586375000000,0.297424679000000,0.136492641000000,0.952695006000000,0.533487446000000,0.175900645000000,0.487751880000000,0.751201553000000,0.594486821000000,0.768845082000000,0.194497390000000,0.846397786000000,0.948648368000000,0.883694182000000,0.252453019000000,0.633572881000000,0.992088904000000,0.931616252000000,0.878929367000000,0.790844057000000,0.179938207000000,0.289391536000000,0.554549420000000,0.395296753000000,0.450513878000000,0.594356244000000,0.0828806590000000,0.00812625900000000,0.793701741000000,0.963653873000000,0.707087568000000,0.129913120000000,0.834297191000000,0.964212650000000,0.0663212680000000,0.913704484000000,0.559311662000000,0.906262972000000,0.0225336340000000,0.454237065000000,0.586202166000000,0.870013239000000,0.168240746000000,0.652098169000000,0.464718374000000,0.690125383000000,0.0439047180000000,0.670195183000000,0.294872752000000,0.193938983000000,0.339857193000000,0.515083287000000,0.226262721000000,0.337370965000000,0.930870449000000,0.713390349000000,0.437174783000000,0.528175648000000,0.686652567000000,0.253247946000000,0.157038365000000,0.170548981000000,0.517590083000000,0.544557990000000,0.149460717000000,0.0667903220000000,0.494605990000000,0.246394498000000,0.574210029000000,0.835118781000000,0.101000418000000,0.217225320000000,0.877028506000000,0.802072893000000,0.658231121000000,0.357477012000000,0.937314225000000,0.810928195000000,0.0349268240000000,0.952493777000000,0.986717376000000,0.197489286000000,0.515601926000000,0.906326039000000,0.0364026220000000,0.187751957000000,0.471879869000000,0.838572131000000,0.0327569510000000,0.266049304000000,0.187327199000000,0.269013006000000,0.600888011000000,0.708205145000000,0.422965411000000,0.369652671000000,0.333433455000000,0.938634974000000,0.544179414000000,0.653786180000000,0.778800398000000,0.235300504000000,0.728775895000000,0.540907766000000,0.179479514000000,0.375769076000000,0.574467599000000,0.195187800000000,0.375831094000000,0.907233542000000,0.907779175000000,0.605679462000000,0.967620616000000,0.401628858000000,0.401038648000000,0.799501622000000,0.555122009000000,0.387230064000000,0.634107156000000,0.949508349000000,0.508688109000000,0.256518251000000,0.523856456000000,0.845205858000000,0.431698516000000,0.136849982000000,0.800146218000000,0.0655803720000000,0.573671338000000,0.738879704000000,0.146346939000000,0.513708050000000,0.826089496000000,0.378852650000000,0.0194125400000000,0.601598254000000,0.893788271000000,0.514537732000000,0.787297697000000,0.873731790000000,0.108199688000000,0.349335444000000,0.285575774000000,0.248361140000000,0.729113560000000,0.769360149000000,0.707972665000000,0.975048482000000,0.237530543000000,0.221877381000000,0.984526832000000,0.0744599810000000,0.698248692000000,0.682107530000000,0.399375938000000,0.791367401000000,0.950517189000000,0.954922472000000,0.766661918000000,0.848354583000000,0.435916159000000,0.350042298000000,0.365222884000000,0.0322273590000000,0.395300467000000,0.341655292000000,0.809651824000000,0.213752219000000,0.467487212000000,0.553706018000000,0.800140544000000,0.185389831000000,0.878282379000000,0.535085336000000,0.108676610000000,0.926820311000000,0.322303083000000,0.383903950000000,0.389501279000000,0.528506135000000,0.443258028000000,0.205597966000000,0.683050203000000,0.515199041000000,0.732885125000000,0.766557543000000,0.819363856000000,0.437181804000000,0.501973625000000,0.298411167000000,0.236378812000000,0.319400326000000,0.697743799000000,0.286844065000000,0.185073539000000,0.546290802000000,0.637404931000000,0.806858403000000,0.954089501000000,0.665059380000000,0.457131810000000,0.325819774000000,0.880839841000000,0.918083350000000,0.788266869000000,0.421956633000000,0.231031531000000,0.188653836000000,0.433196277000000,0.265360172000000,0.481356838000000,0.939311891000000,0.263187552000000,0.467431344000000,0.629513914000000,0.603638351000000,0.716148937000000,0.251841339000000,0.178412643000000,0.928345652000000,0.682455912000000,0.189980124000000,0.166535991000000,0.501527380000000,0.281825468000000,0.245669786000000,0.888217501000000,0.436394991000000,0.412790473000000,0.358710710000000,0.623243590000000,0.0692883300000000,0.395378409000000,0.876062898000000,0.823648849000000,0.377727292000000,0.874932767000000,0.330887418000000,0.00212810000000000,0.443754571000000,0.490221516000000,0.989340090000000,0.575653112000000,0.196481040000000,0.604646596000000,0.760077298000000,0.642330632000000,0.847811670000000,0.704414869000000,0.928299459000000,0.511773140000000,0.540193585000000,0.184798629000000,0.356550239000000,0.673762306000000,0.273130963000000,0.682738197000000,0.548951010000000,0.285531689000000,0.689303785000000,0.112543439000000,0.155860921000000,0.0280870260000000,0.318250785000000,0.410204284000000,0.653683828000000,0.877597786000000,0.0662552610000000,0.148009141000000,0.843144099000000,0.138021277000000,0.506250240000000,0.976909505000000,0.519709920000000,0.264802971000000,0.883310786000000,0.192821325000000,0.624311595000000,0.312575500000000,0.292201295000000,0.873534966000000,0.912037578000000,0.296874786000000,0.616842847000000,0.700939254000000,0.445809874000000,0.941305602000000,0.703949479000000;0.210785091000000,0.820043172000000,0.547906951000000,0.961470474000000,0.290355259000000,0.00188859600000000,0.667669084000000,0.692354849000000,0.796831606000000,0.916601560000000,0.907714826000000,0.497768080000000,0.632531556000000,0.111220889000000,0.189531598000000,0.266448045000000,0.331869378000000,0.188078204000000,0.186528488000000,0.122104982000000,0.472958234000000,0.353916324000000,0.561231185000000,0.326727710000000,0.822608419000000,0.360307458000000,0.219769778000000,0.687209424000000,0.951302479000000,0.649111092000000,0.503861304000000,0.0154700840000000,0.376314960000000,0.589870610000000,0.922454173000000,0.0389056790000000,0.252913610000000,0.264225193000000,0.129964205000000,0.220122905000000,0.935455220000000,0.709511290000000,0.255513416000000,0.0298936700000000,0.642690346000000,0.510396134000000,0.109929359000000,0.497490167000000,0.555377923000000,0.265439436000000,0.0432447010000000,0.112261392000000,0.0383089770000000,0.203483790000000,0.431341677000000,0.496796465000000,0.267826162000000,0.428481965000000,0.958973195000000,0.567752055000000,0.543076745000000,0.395946952000000,0.293607062000000,0.393345458000000,0.571337943000000,0.938786380000000,0.491053808000000,0.406099676000000,0.129335401000000,0.628955434000000,0.954949916000000,0.150691768000000,0.637416294000000,0.311032451000000,0.0386361250000000,0.848951750000000,0.110662284000000,0.926321852000000,0.243669431000000,0.145921420000000,0.882820461000000,0.702922448000000,0.298194603000000,0.737535061000000,0.717386637000000,0.817360399000000,0.946644107000000,0.941497210000000,0.196200969000000,0.0542202250000000,0.251508128000000,0.497562092000000,0.713091070000000,0.580113509000000,0.889197040000000,0.245784171000000,0.201113109000000,0.197598838000000,0.0266998300000000,0.503815509000000,0.720711520000000,0.0767014010000000,0.443232280000000,0.751049278000000,0.260936137000000,0.940194630000000,0.164655609000000,0.831081433000000,0.845099840000000,0.147655510000000,0.498230626000000,0.798094221000000,0.784890828000000,0.741004299000000,0.290952072000000,0.222559546000000,0.599438960000000,0.260928920000000,0.166522340000000,0.812136333000000,0.602770457000000,0.386298361000000,0.140391524000000,0.576223052000000,0.693549795000000,0.224451350000000,0.255333776000000,0.724743681000000,0.651786385000000,0.366887698000000,0.187649781000000,0.0571330690000000,0.647227823000000,0.669920099000000,0.402813374000000,0.500367123000000,0.0378201160000000,0.458020899000000,0.773786377000000,0.720442538000000,0.307419364000000,0.432869038000000,0.443090365000000,0.743046688000000,0.332428753000000,0.339529218000000,0.357513390000000,0.760872201000000,0.552545739000000,0.930433881000000,0.635153122000000,0.0426446270000000,0.721027092000000,0.574161802000000,0.517972227000000,0.395323747000000,0.587322466000000,0.421032356000000,0.119334556000000,0.779884247000000,0.565082594000000,0.231321935000000,0.711215968000000,0.426035868000000,0.298006553000000,0.864545138000000,0.604464715000000,0.104093516000000,0.611542705000000,0.867888444000000,0.0396207980000000,0.956619366000000,0.907186152000000,0.419142666000000,0.645584402000000,0.276605599000000,0.449669346000000,0.903916653000000,0.754891924000000,0.147540899000000,0.941274689000000,0.0219109090000000,0.927600286000000,0.310311799000000,0.114563373000000,0.679181079000000,0.384965834000000,0.398145551000000,0.215301998000000,0.734232592000000,0.988186533000000,0.935863609000000,0.598128067000000,0.314362809000000,0.800331349000000,0.745828319000000,0.129771713000000,0.247238046000000,0.388556743000000,0.377340553000000,0.995688691000000,0.741281761000000,0.744215017000000,0.366133833000000,0.519482820000000,0.214613030000000,0.824739519000000,0.0545840270000000,0.458605817000000,0.556059238000000,0.511986650000000,0.170370114000000,0.108371139000000,0.293612692000000,0.529246989000000,0.839190364000000,0.0779378760000000,0.0166497160000000,0.170326874000000,0.621854686000000,0.554683158000000,0.0243367950000000,0.231181199000000,0.555616908000000,0.908629007000000,0.664716202000000,0.383610474000000,0.898428084000000,0.839965930000000,0.423058246000000,0.879194088000000,0.0333749130000000,0.444026739000000,0.710152678000000,0.572899897000000,0.996600686000000,0.420919170000000,0.720781365000000,0.00732406200000000,0.898822777000000,0.444128226000000,0.997825996000000,0.644466096000000,0.0650497850000000,0.292623263000000,0.776792373000000,0.0424459150000000,0.823688307000000,0.542497072000000,0.961246889000000,0.762704430000000,0.0343041360000000,0.728057982000000,0.373643847000000,0.668124402000000,0.00729027000000000,0.415349496000000,0.606490834000000,0.817712347000000,0.223588541000000,0.856626971000000,0.850296014000000,0.0576293300000000,0.277478524000000,0.643420884000000,0.927252000000000,0.0464007980000000,0.657443243000000,0.268051854000000,0.232862230000000,0.0245486510000000,0.888252496000000,0.308358465000000,0.319380224000000,0.904698891000000,0.417472399000000,0.736479836000000,0.550189442000000,0.524617006000000,0.0451782830000000,0.303495598000000,0.985781850000000,0.327215561000000,0.520047046000000,0.831169717000000,0.0470205960000000,0.824020004000000,0.888617490000000,0.858795589000000,0.457751935000000,0.679825285000000,0.808708477000000,0.474067711000000,0.637895917000000,0.251646300000000,0.545036647000000,0.793020453000000,0.438694742000000,0.987329642000000,0.670192896000000];
    w = [0.00660606300000000,0.321987670000000,0.367067796000000,0.705726160000000;0.503130016000000,0.108686309000000,0.137133185000000,0.858712287000000;0.187492890000000,0.0117453450000000,0.723044353000000,0.850101160000000;0.339877113000000,0.513948020000000,0.575496258000000,0.476872609000000];
    cycles = 0;
    % define w and wBar
end