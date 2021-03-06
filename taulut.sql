drop database if exists kirjakauppa;

create database kirjakauppa;

use kirjakauppa;

create table tuoteryhma (
    id int primary key auto_increment,
    name varchar(50) not null
);

create table tuote (
    id int primary key auto_increment,
    name varchar(100) not null,
    author varchar(100) not null,
    price double (10,2) not null,
    image varchar(50),
    description text,
    category_id int not null,
    foreign key (category_id) references tuoteryhma(id)
);

CREATE TABLE asiakas (
    astunnus int primary key auto_increment,
    username varchar(15) NOT null,
    asnimi varchar(50) NOT null,
    salasana varchar(255),
    puhelinro int(12) NOT null,
    osoite varchar(50) NOT null,
    postitmp varchar(35) NOT null,
    postinro varchar(5) NOT null,
    maa varchar(30) NOT null
);

create table tilaus (
    tilausnro int primary key auto_increment,
    astunnus int not null,
    tilauspvm datetime default CURRENT_TIMESTAMP,
    foreign key (astunnus) references asiakas(astunnus)
);

CREATE TABLE tilausrivi (
    tilausnro int NOT NULL,
    tuotenro int,
    foreign key (tilausnro) REFERENCES tilaus(tilausnro),
    foreign key (tuotenro) REFERENCES tuote(id)
);

CREATE TABLE henkilosto (
    tunnus int primary key auto_increment,
    nimi char(30) not null,
    osoite char(50),
    postinro char(5),
    postitmp char(20),
    puhelinro int(12),
    rooli char(30)
);

INSERT INTO `tuoteryhma`(`name`) VALUES ('Romanssi');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Kauhu');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Rikos');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Sci-fi');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Fantasia');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Lasten kirjallisuus');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Sarjakuvat');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Dystopia');

INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Christian ja Judith','Marcus Barnes',5.00, 'img_1.png','Christian Ramsbottom on komea, hoikka ja rohkea lakimies Ohiosta. H??nen el??m??ns?? ei mene mihink????n, kunnes h??n tapaa Judith Parkerin, kuuman, kalpean naisen, jolla on intohimo ruoanlaittoon.
Christian ei v??lit?? v??litt??m??sti Judithista ja ajattelemattomista ja ylimielisist?? tavoista, jotka h??n on oppinut vuosiensa aikana Euroopassa.
Kuitenkin, kun vampyyri yritt???? ry??st???? Christiania,Judith l??htee auttamaan. Christian alkaa huomata, ett?? Judith on itse asiassa melko hyveellinen.
Mutta Judithin yksityisetsiv??n?? tekem??t paineet j??tt??v??t h??net sokeaksi Christianin kiintymyksille, ja Christian aloittaa lukemisen yritt????kseen h??irit?? itse????n.
Lopuksi, kun kontrolloiva psykiatri Harold Chan, uhkaa tulla heid??n v??liins??, Judithin on toimittava nopeasti. Mutta l??yt??v??tk?? he koskaan ansaitsemansa kiihke??n rakkauden?
', 1);
INSERT INTO `tuote`( `name`, `author`, `price`, `image`,`description`, `category_id`) VALUES ('Sitten tuli Mo','Lavina Coenraad',4.00, 'img_2.png','Zach Torrance on lyhyt, ohut ja intuitiivinen mekaanikko Englannista. H??nen el??m??ns?? ei mene mihink????n, kunnes h??n tapaa Mo Smithin, karvaan, kuuman miehen, jolla on intohimo hillomonttuja kohtaan.
Zach ei v??lit?? v??litt??m??sti Moista ja h??nen huijaavista ja kylm??verisist?? tavoista, jotka h??n oppi Englannissa.
Kuitenkin, kun joukkomurhaaja yritt???? kuristaa Zachia, Mo l??htee apuun. Zach alkaa huomata, ett?? Mo:lla on itse asiassa melko yst??v??llinen syd??n.
Mutta Mo: n kirjoittajan paineet j??tt??v??t h??net sokeaksi Zachin kiintymyksille, ja Zach ryhtyy postimerkkien ker????miseen yritt????kseen h??irit?? itse????n.
Lopuksi, kun itsek??s kirjailija Joshua Rockatansky uhkaa tulla heid??n v??lilleen, Mo: n on toimittava nopeasti. Mutta l??yt??v??tk?? he koskaan ansaitsemansa syv??n rakkauden?
', 1);
INSERT INTO `tuote`( `name`, `author`, `price`, `image`,`description`, `category_id`) VALUES ('Joku kuten Kathy','Nirav Samo',49.00, 'img_3.png','Annabelle Nolan on p??rr??inen, kaunis ja maanl??heinen tietokoneohjelmoija kaupungista. H??nen el??m??ns?? ei mene mihink????n, ennen kuin h??n tapaa Kathy Khanin, kuuman, hoikkaan naisen, jolla on intohimo musiikkiin.
Annabelle ei v??lit?? heti Kathysta ja h??nen h??mmentyneist?? ja juonittelevista tavoista, jotka h??n on oppinut vuosiensa aikana kaupungissa.
Kuitenkin, kun leijona yritt???? hy??k??t?? Annabellen kimppuun, Kathy l??htee pelastamaan. Annabelle alkaa huomata, ett?? Kathy on itse asiassa melko vaatimaton.
Mutta Kathyn kalamyym??l??n paineet j??tt??v??t h??net sokeaksi Annabellen kiintymyksille ja Annabelle ryhtyy golfiin kokeilemaan itse????n.
Lopuksi, kun tahditon mekaanikko Sandie DeVito uhkaa tulla heid??n v??liins??, Kathyn on toimittava nopeasti. Mutta l??yt??v??tk?? he koskaan ansaitsemansa lihavan rakkauden?
', 1);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Hopeisen pianon kirous','Jessica Andrews',34.00, 'img_4.png','Tutkiessaan paikallisen navigaattorin kuolemaa suloinen siivooja nimelt?? Sophia Zeus paljastaa legendan yliluonnollisesti kirotusta hopeapianosta, joka kiert???? kaikkialla Kanadassa. Heti kun joku soittaa pianoa, h??nell?? on el???? t??sm??lleen 90 p??iv????.
Harvat tuomitut n??ytt??v??t olevan tavallisia ihmisi?? p??ivitt??isess?? el??m??ss??, mutta kuvatessaan ne n??ytt??v??t harmailta. Merkitty henkil?? tuntuu omituiselta kissanpennulta.
Sophia saa k??siins?? pianon, kielt??ytym??tt?? uskomasta taikauskoa. H??nen mieleens?? vilkkuu kuvakollaasi: taaksep??in kiipe??v?? koala, joka tasapainottaa tungosta navigaattorissa, vanha sanomalehden otsikko py??r??ilyonnettomuudesta, hupullinen m??yr??, joka h??mment???? varpaita, ja harmaassa paikassa sijaitseva juomakaivo.
Kun Sophia huomaa silm??ripsien olevan kissanpennun silm??ripsien kaltaisia, h??n tajuaa, ett?? hopeapianon kirous on totta, ja kutsuu yst??v??ns??, kalastaja Harold Superhalkiksi, auttamaan.
Harold tutkii pianoa ja alistuu mielell????n kiroukseen. H??n huomaa, ett?? samat n??kym??t vilkkuvat h??nen silm??ns?? edess??. H??n pit???? taaksep??in kiipe??v???? koalaa tasapainottamassa tungosta navigaattorissa erityisen viilent??v??n??. H??n liittyy yliluonnollisen kuoleman jonoon.
Sophia ja Harold pyrkiv??t paljastamaan visioiden merkityksen aloittamalla hupullisen m??yr??n etsinn??n. Pystyv??tk?? he lopettamaan kirouksen ennen kuin heid??n aikansa on loppunut?
', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Kadonnut veljen poika','Pilar Michaela',93.00, 'img_5.png','Er????n?? aamuna pime??ss?? talossaan Kentiss??, Rachel Gump avaa veljenpoikansa Steve Jonesin lahjan, ja Rachel tiet????, ett?? heid??n el??m??ns?? ei tule koskaan olemaan en???? samanlainen.
Yritt??ess????n rakentaa el??m????ns?? Rachel todistaa murhan, joka saa h??net kyseenalaistamaan uuden yst??vyytens??. H??nelle tulee pakkomielle salaper??iseen muukalaiseen Zoe Zeuseen. Mik?? on Zoen yhteys Steveen, ja miksi h??n on nyt tullut paikalle?
Rachelin k??ytt??ytyminen muuttuu yh?? ep??vakaammaksi, kun h??n yritt???? selvitt???? totuuden ja kalmarin pianon merkityksen taistellessaan samalla selviyty??kseen kroonisesta v??symysoireyhtym??st??.
Joka p??iv?? Rachel l??hestyy totuutta. Ja mit?? l??hemm??ksi h??n tulee, sit?? kauhistuttavalta se n??ytt????.
', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Raadeltu banaani','Saku Dobromil',94.00, 'img_6.png','Vieh??tt??v??ss?? Sludgesiden rannikkokaupungissa on salaisuus.
Jeff Greenwaylla on t??ydellinen el??m??, kun h??n ty??skentelee asianajajana kaupungissa ja ui merkitt??v??n tytt??yst??v??ns?? Marion Plumbin kanssa.
Kuitenkin, kun h??n l??yt???? repeytyneen banaanin kellaristaan, h??n alkaa ymm??rt????, ett?? asiat eiv??t ole aivan niin kuin ne n??ytt??v??t olevan Greenway-perheess??.
Baari-micva j??tt???? Jeffille h??mm??stytt??vi?? kysymyksi?? menneisyydest????n, ja h??n l??htee idylliseen Sludgesideen etsim????n vastauksia.
Aluksi Sludgesiden asukkaat ovat suloisia ja upeita. H??nt?? kiehtoo utelias rohkea yksityisetsiv?? Una Malkovich. Kuitenkin, kun Jeff on tutustuttanut h??net kovaan vaseliiniin, h??n joutuu hitaasti taipumaan toisena henkil??n?? esiintymisen, ilkivallan ja ehk?? jopa julmuuden verkkoon.
Voiko Jeff vastustaa Una Malkovichin hurmaa ja paljastaa repeytyneen banaanin salaisuuden, ennen kuin on liian my??h??ist??, vai tuleeko h??nen kuolemastaan j??lleen yksi Sludgeside-legenda?
', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Ruhjotut k??det','Iris Hawkins',10.00, 'img_7.png','Ruhjotut k??det ovat k????ntyneet ymp??ri New Yorkia, ja asukkaat ovat peloissaan. Kymmenen murhaa kymmeness?? viikossa, jotka kaikki on tehty veitsell??, eik?? kenell??k????n ole aavistustakaan kuka taktiton tappaja on.
Herra Brad Bishop on heikko ja hauska poliisi, joka rakastaa ruoanlaittoa. H??n ei viel?? tied?? sit??, mutta h??n on ainoa, joka pystyy pys??ytt??m????n s????lim??tt??m??n tappajan.
Kun h??nen rakastajansa, Richard Godfrey, siepataan, herra Bishop huomaa olevansa heitetty tutkimuksen keskelle. H??nen ainoa vihje on hopeahattu.
H??n pyyt???? intuitiivisen etsiv??n, Annie McCallisterin, apua.
Voiko McCallister auttaa Bradia voittamaan sokeririippuvuutensa ja l??yt??m????n vastaukset, ennen kuin taktitonnen tappaja ja h??nen tappava veitsens?? lakkoavat uudelleen?
', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Lumottu ase','Svanhild Gil',50.00, 'img_8.png','Meluisassa englantilaisessa Glasgow:n kaupungissa on salaisuus.
Catherine Thunderill?? on t??ydellinen el??m?? ty??skennelless????n psykiatrina kaupungissa ja hyrrytt??en vakaan tytt??yst??v??ns?? Kimberly Khanin kanssa.
Kuitenkin, kun h??n l??yt???? kellaristaan pienen voileiv??n, h??n alkaa ymm??rt????, ett?? asiat eiv??t ole aivan niin kuin Thunderin perheess?? n??ytt????.
Rave j??tt???? Catherinen h??mm??stytt??viin kysymyksiin menneisyydest????n, ja h??n l??htee etsim????n Glasgowiin etsim????n vastauksia.
Aluksi Glasgowin ihmiset ovat yst??v??llisi?? ja ihailtavia. H??nt?? kiehtoo utelias ihastuttava opettaja Rachel Sparkle. Kuitenkin sen j??lkeen, kun Catherine on tutustuttanut h??net kovaan vaseliiniin, h??n hakeutuu hitaasti ahmimisen, mustasukkaisuuden ja ehk?? jopa silpomisen verkkoon.
Voiko Catherine vastustaa Rachel Sparklen hurmaa ja paljastaa pienen voileiv??n salaisuuden, ennen kuin on liian my??h??ist??, vai tuleeko h??nen kuolemastaan j??lleen yksi Glasgowin legenda?
', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Mennyt rakastaja','Romulo Yuna',12.00, 'img_9.png','Er????n?? aamuna Australiassa sijaitsevassa talossa Pete Superhalk avaa lahjan rakastajaltaan Forest MacDonaldilta, ja Pete tiet????, ett?? heid??n el??m??ns?? ei koskaan en???? ole sama.
Yritt??ess????n rakentaa el??m????ns?? Pete todistaa rikoksen, joka saa h??net kyseenalaistamaan uuden suhteen. H??nelle tulee pakkomielle arvoituksettoman muukalaisen Forest Lakemanin kanssa. Mik?? on h??nen yhteys Forestiin, ja miksi h??n on ilmestynyt nyt?
Peten k??ytt??ytyminen muuttuu yh?? ep??vakaammaksi, kun h??n yritt???? selvitt???? haalistuneen veitsen totuuden ja merkityksen taistellessaan unettomuuden torjumiseksi.
Joka p??iv?? Pete l??hestyy totuutta. Ja mit?? l??hemm??ksi h??n tulee, sit?? ep??todenn??k??isemm??lt?? se n??ytt????.
', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Galaktiset intohimoiset kynttil??njalka sodat','Lorenzo Martin',21.00, 'img_10.png','Kauan, kauan sitten intohimoisessa galaksissa ...
L??hdetty????n kostealta maapallolta, j??ttil??isi?? lent???? kohti kaukaista pilkkua. Pilkku hajoaa v??hitellen j????tyneeksi avaruusasemaksi.
Sis??llissota iskee galaksiin, jota hallitsee vaalea velho Josh Bishop, joka kykenee kaikenlaiseen julmuuteen.
Kauhuissaan Shane Pittin?? tunnettu kaunis lohik????rme joutuu pakenemaan imperiumia suojelijansa Dolly Bondin kanssa.
He suuntaavat Los Angelesiin Neptunuksen planeetalla. Kun he vihdoin saapuvat, puhkeaa taistelu. Bond k??ytt???? intohimoista kynttil??njalkaaan puolustamaan Shanea.
Bondin on taisteltava pelastamaan Dragon Shane, mutta kun h??n vahingossa paljastaa huolettoman ter??n, intohimoisen, kostean galaksin koko tulevaisuus on vaakalaudalla.
', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Pienet pistoolisodat','Jasmin Cynthia',78.00, 'img_11.png','Kauan, kauan sitten pienen pienell?? planeetalla ..
L??hdetty????n kuumalta maaplaneetaltaan joukko zombieta lent???? kohti loistavaa t??pl????. T??pl?? hajoaa v??hitellen mutkikkaaksi avaruuskorkeudeksi.
Sis??llissota pieksee galaksia, jota hallitsee mo grey, paisuva keiju, joka kykenee ahmimaan ja jopa murhaamaan.
Kauhuissaan ruskea zombi, joka tunnetaan nimell?? Naomi Smart, pakenee imperiumia avustajansa Charity Parkerin kanssa.
He suuntaavat Falmouthiin Scoboni-planeetalla. Kun he vihdoin saapuvat, puhkeaa verinen taistelu. Parker k??ytt???? v??h??pistooliaan Naomin puolustamiseen.
Parker ja Zombie Naomi p????tt??v??t, ett?? on aika l??hte?? Scobonista ja varastaa auto.
He kohtaavat robottien heimon, jotka vangitsevat zombin ja pyrkiv??t viem????n h??net takaisin Falmouthiin.
Parkerin on taisteltava pelastaakseen Zombie Naomi, mutta kun h??n vahingossa kaivaa esiin kauniin veitsen, vaarana on koko pienen planeetan tulevaisuus.
', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Vaaleanpunainen k??ysi','Viola Hormizd',100.00, 'img_12.png','Ei niin kauaa sitten vaaleanpunaisessa galaksissa ...
L??hdetty????n ruuhkaiselta Tatooine-planeetalta joukko ulkomaalaisia lent???? kohti kaukaista pinkki?? pilkkua. Pilkku hajoaa v??hitellen leve??ksi avaruudeksi.
Sota repi pinkki?? galaksia, jota hallitsi Jack DeVito, villi pixie, joka kykenee esiintym????n ja jopa sieppaamaan.
Kauhuissaan kaupunkilohik????rme, joka tunnetaan nimell?? Suzanne Walker, pakenee imperiumia is??nt??ns?? Chantal Hemingwayn kanssa.
He suuntaavat Yl??-Boggingtoniin Epsilon Eridani-planeetalle. Kun he vihdoin saapuvat, puhkeaa erimielisyys. Hemingway k??ytt???? vaaleanpunaista k??ytt?? Suzannen puolustamiseen.
Hemingway ja Dragon Suzanne p????tt??v??t, ett?? on aika l??hte?? Epsilon Eridanista ja varastaa mopo ja pari asetta.
He kohtaavat ihmisten heimon. Miehet vangitsevate Hemingwayn ja lohik????rmeen, sek?? viev??t heid??n takaisin Yl??-Boggingtoniin.
Hemingwayn on taisteltava pelastaakseen Dragon Suzanne, mutta kun h??n vahingossa kaivaa esiin ruskean kiven, vaakalaudalla on koko vaaleanpunaisen ja tunkkasen galaksin tulevaisuus.
', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Viimeinen fantasia','Shiva Anderws',49.00, 'img_13.png','Talossa asui kostea ja t??ytel??inen lohik????rme nimelt?? Harriet Bond. Ei piikik??s,mutta herkk?? ja idyllinen talo, t??ynn?? housuja ja aurinkoisia hajua, eik?? silti ruskea, kaareva, hiljainen talo, jossa ei ole miss?? istua tai sy??d??: se oli lohik????rmem??kki, ja se tarkoittaa l??mp????.
Er????n?? p??iv??n??, pixie Flora Gloopin huolestuttavan vierailun j??lkeen Harriet l??htee talostaan etsim????n kolmea karvaista makkaraa. Teht??v??, joka toteutetaan nuoren ja pahan goblinin seurassa.
Etsitess????n pixie-vartioituja makkaroita Harriet Bond yll??tt???? jopa itsens?? ??lykkyydell????n ja taidollaan kirjoittajana.
Matkansa aikana Harriet pelastaa taskulampun, Floralle kuuluvan perinn??n. Mutta kun Flora kielt??ytyy kokeilemasta juhlia, heid??n yst??vyytens?? on ohi.
Flora on kuitenkin haavoittunut Ison-Britannian taistelussa ja molemmat sopivat juuri ennen kuin Harriet ryhtyy vakaviin juhliin.
Harriet hyv??ksyy yhden kolmesta karvaisesta makkarasta ja palaa taloonsa hyvin varakkaana lohik????rmen??.
', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Keijukainen, Reginald Greenway','Linus Jemma',38.00, 'img_14.png','M??kiss?? asui raidallinen, juonitteleva keijukainen nimelt?? Reginald Greenway. Ei huolestuttava, mutta kuohuva ja runsas m??kki, joka on t??ynn?? kolikoita ja yksinkertaisia hajuja ja joka ei siltik????n j??inen, pahaa tarkoittava taikka hiljainen m??kki, jossa ei ole miss?? istua tai  mit????n sy??d??: se oli keijukais-kota, ja se tarkoitti mukavuutta .
Er????n?? p??iv??n??, Helin Hemingwayn huolestuttavan vierailun j??lkeen, Reginald l??htee m??kist????n ja suuntaa etsim????n kolmea t??pl??robottia. Teht??v?? on suoritettava velhojen, j??ttil??isten ja ????li??-nuorten seurassa.
Reginald Greenway l??yt???? itsens?? k??rsiv??llisyydell????n ja taidoillaan kampaajana.
Matkansa aikana Reginald pelastaa ter??n, Helenille kuuluvan perinn??n. Mutta kun Helen kielt??ytyy kokeilemasta boppingia, heid??n yst??vyytens?? on ohi.
Helen on kuitenkin haavoittunut Waterloon taistelussa ja molemmat sopivat juuri ennen Reginaldin ryhtymist?? vakavaan hypp????miseen.
Reginald hyv??ksyy yhden kolmesta t??pl??robootista ja palaa m??kkiins?? hyvin k??yh??n?? keijukaisena.
', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Hirven uni','Ingrid Valentinus',104.00, 'img_15.png','Kuopassa asui pullea, ruskea hirvi nimelt?? Alex Cockle. Kuoppa ei ollut vieh??tt??v??n idyllinen eik?? siin?? ollut sensaatiomaista, punaista, villi?? tillaa jossa olisi voinut nukkua.Mutta se oli kuitenkin hirvikuoppa, mik?? tarkoitti suojaa.
Aave Lauren Randallin ep??ilytt??v??n vierailun j??lkeen, Alex l??htee kuopastaan ja yritt???? l??yt???? kolmea meluisaa hurmaa. Teht??v?? on suoritettava pahojen noitien ja keijujen kanssa.
Alex Cockle etsii haamuvarastettuja hurmaa ja matkallaan l??yt???? itsest????n yst??v??llisyyden ja salaisen taidon tietokoneohjelmointiin.
Matkansa aikana Alex pelastaa makkaran, Laurenin perinn??n. Mutta kun Lauren kielt??ytyy kokeilemasta lenkkeily??, heid??n yst??vyytens?? on ohi.
Lauren on kuitenkin haavoittunut Blenheimin taistelussa ja kaksi sopivat juuri ennen kuin Alex ryhtyy vakavaan lenkkeilyyn
Alex hyv??ksyy yhden kolmesta meluisasta hurmasta ja palaa kotiin kuoppaansa tyytyv??isen??.
', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Doris ja Tometta - Sharfootin peikonmets??st??j??t','Lesley Ferrari Gordon',27.00, 'img_16.png','Doris Barlow on vain tavallinen viisivuotias tytt??, joka asuu Sharpfootissa, kunnes h??n n??kee kauhistuttavan peikon, Earlobe Mudbather, kiipe??v??n sis????n makuuhuoneen ikkunasta.
Earlobe, joka on rakennettu kuin kivi?? t??ynn?? oleva peruna ja joka haisee kuin raastetut rotton-nauriit, jotka on tukahdutettu roskakorista valmistetulla kastikkeella, laulaa laulun pienist?? tyt??ist??.
Doris huijaa peikkoa putoamaan ulos ikkunastaan kertomalla h??nelle, ett?? ulkona on lasten aivojen juustoleipi??. H??n tajuaa, ett?? peikko on lopetettava, ennen kuin h??n sy?? enemm??n lapsia ja ryhtyy t??ihin yritt??en keksi?? ansan.
Samaan aikaan luolassa aivan Sharpfootin ulkopuolella Tometta Stink alkaa ep??ill??, ett?? lasten sy??minen on v????rin, ja kyll??styy mets??st??m????n muiden peikkojen kanssa. H??n p????tt???? el???? kasvissy??j??n??.
Lyhyen v????rink??sityksen j??lkeen, johon sis??ltyi ketsupin jalka ja sidokset, Doris ja Tometta ryhtyv??t pys??ytt??m????n peikot, k??ytt??en herneit?? ampuvaa katapulttia. He houkuttelevat peikkoja luomalla suuren armeijan skunk-kouluttajia.
', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Charity ja Slug ??? Earwax Cityn sankarit','Mijo Sosimo',37.00, 'img_17.png','Charity Parkes on uniikki seitsem??nvuotia tytt??, joka asuu Earwax Cityss??, kunnes h??n n??kee kammottavan peikon, Christian Greentonguen, kiipe??v??n sis????n savupiipusta.
Christian, joka n??ytt???? kuin kivi?? t??ynn?? olevalta perunalta ja joka tuoksuu raastetuilta haisevilta kengilt??,  laulaa laulun pienten tytt??jen tekemisest?? juustoleivist??.
Hyv??ntekev??isyys huijaa peikon putoamaan ikkunasta.Pudottuaan, h??n tajuaa, ett?? peikko on lopetettava, ennen kuin h??n sy?? enemm??n lapsia ja ryhtyy t??ihin yritt??en keksi?? ansan.
Lyhyen v????rink??sityksen j??lkeen, johon liittyy pieni sormi ja ketsupin rutistaminen, Charity ja h??nen rohkea etanansa,Slug ryhtyv??t pys??ytt??m????n peikot, k??ytt??m??ll?? katapulttia, joka ampuu porkkana paloja. He houkuttelevat peikkoja luomalla suuren l??j??n haisevia kenki??.
', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Garyn salaisuus','Hadubert Photina',107.00, 'img_18.png','West Bogginsissa on utelias uusi poika, ja kaikki puhuvat h??nest??. H??mm??stytt??v??n karvainen ja tuhoisasti villi, kaikki pojat haluavat yst??vysty?? h??nen kanssaan. Gary MacDonaldilla on kuitenkin salaisuus - h??n on pelottava vampyyri.
Tommy Randall on lempe??, ohut poika, joka nauttii neulomisesta. Gary her??tt???? h??ness?? kiinnostuksen, sill?? h??n pystyy pys??ytt??m????n kuorma-autot paljain k??sin. Tommy ei ymm??rr?? miten Gary pystyy t??ill??iseen ihan itse.
H??nen paras yst??v??ns??, intuitiivinen hirvi nimelt?? Doris, auttaa Tommy?? aloittamaan palapelin kokoamisen. Yhdess?? he selvitt??v??t Garyn mysteerin.
Kun valkosipulit alkavat k????nty?? ymp??ri West Bogginsia, Tommy alkaa pel??t?? pahinta. Hirvi kehottaa h??nt?? ilmoittamaan Garyst?? opettajille ja h??n tiet????, ett?? h??nen pit??isi, joten mik?? est???? h??nt???
Saako h??n riehuvan vampyyrin kiinni?
', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Darth, vamppyyrintappaja','George King',46.00, 'img_19.png','Liverpoolissa on uusi rohkea tytt?? ja h??n puhuu kaikkea. H??mm??stytt??v??n ohut ja tuhoisasti vahva, kaikki pojat haluavat h??nt??. Ocean Thomasilla on kuitenkin salaisuus - h??n on erikoinen vampyyri.
Darth Sparrow on maanl??heinen, utelias poika, joka nauttii jalkapallosta. Ocean kiehtoo h??nt??,koska h??n pystyy pys??ytt??m????n helikopterit paljain k??sin. H??n ei ymm??rr??, miksi h??n on niin itsen??inen.
H??nen paras yst??v??ns??, huomaavainen ogre nimelt?? Una, auttaa Darthia aloittamaan palapelin kokoamisen. Yhdess?? he l??yt??v??t lopullisen aseen - keltaisen,lumotun partaveitsen.
Kun ruumiit alkavat k????nty?? ymp??ri Liverpoolia, Darth alkaa pel??t?? pahinta. Ogre kehottaa h??nt?? ilmoittamaan Oceanista poliisille ja h??n tiet????, ett?? h??nen pit??isi, joten mik?? est???? h??nt???
H??n voi vastustaa Oceanin puremista, mutta voiko h??n vastustaa h??nen hurmaa?
', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Enkelin potku','Conrad Brady',77.00, 'img_20.png','Roy Fish ep??ili, ett?? jokin oli hieman v????rin, kun h??nen kammottava sissi yritti potkia h??nt?? vasta kuuden vuoden ik??isen??. Siit?? huolimatta h??n eli suhteellisen normaalia el??m???? muiden ihmisten keskuudessa.
Vasta kun h??n t??rm??si paholaisen armolliseen enkeliin, Doris Rabbitiin, h??nen el??m??ns?? alkoi lopulta olla j??rkev????.
Doris osoittautui kuitenkin valtavaksi ja h??nell?? n??ytti olevan ep??terveellinen pakkomielle rakastamisesta. Roy sai pian tiet????, ett?? Doris oli vannonut valan,ett?? h??n ei koskaan kutittaisi ihmist??.
Kun Royn kammottava sissi loukkaantuu makkaraonnettomuudessa, Roy tajuaa, ett?? h??nen oma el??m??ns?? on vaarassa.
Huolimatta Dorisin luontaisesta pahuudesta ja sumeista siivist??, Roy joutuu putoamaan enkelin puoleen. Vain kohtalo p????tt???? tappaa vai suojeleeko h??n h??nt??.
Er????n?? iltana sireeni ilmestyy Royn eteen ja varoittaa h??nt?? pimeydest?? Doriksessa. Sireeni antaa Royn maagisen kynttil??njalan - ainoan aseen, joka voi voittaa armollisen enkelin.
Tuleeko Roy itsess????n tappamaan ainoan olennon, joka on saanut h??net tuntemaan itsens?? todella ep??ilev??ksi? (Vihje: kyll??!)
', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Salaper??inen, antava poliisi','Domitianus Cornelius',104.00, 'img_21.png','Carla Johnson on huomaavainen poliisi maagisesta Euroopasta. H??n el???? idyllist?? el??m????. Kaikki t??m?? kuitenkin muuttuu, kun Carla varaa kes??loman autioon Camborneen.
Aluksi Carla pit???? Cambornea hyvin unisena. Sitten salaper??inen, antava mekaanikko Gregory Willis, saa h??net ep??iem????n.
Kun Gregory kutsuu h??net keskusteluretkelle, Carla alkaa ymm??rt????, ett?? Gregory on syv??sti rohkea ja juonitteleva mies
Carla tiet???? syd??mess????n, ett?? Gregory on mies h??nelle. Auttaakseen onneaan Carlan t??ytyy kuitenkin torjua juonitteleva mekaanikko Toby Chan, joka haluaa saada upotettua kyntens?? Gregoryyn.
K??ytt??m??ll?? v??kivaltaista keittoa ja molemminpuolista rakkautta musiikkiin Carla aikoo ry??st???? Gregoryn lopullisesti. Mutta palauttaako antava poliisi kiintymyksens???
', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('2033, Merit??hden vuosi','Parthalan Duha',67.00, 'img_22.png','Supervirus on tuhonnut maailman sellaisena kuin me sen tunnemme.
Vuosi on 2033. Kanada on j????tynyt paikka, jota hallitsee merit??hti. Aikaisemmin loistava Grand Canyon on nyt kivinen.
Riemukas mekaanikko, rouva Polly Nolan on ihmiskunnan ainoa toivo. Polly l??yt???? rohkeuden perustaa salainen vallankumouksellinen j??rjest?? nimelt?? Seitsem??n sutta.
Taistelu vaarantuu, kun ilke?? asianajaja Lord Barry Bishop huijaa Polly?? ja loukkaa h??nen vasemman silm??ns??.
Aseilla, ??ly- ja happis??ili??ill?? Seitsem??n sutta yritt???? parhaansa pelastaa ihmiskunnan, mutta voivatko he voittaa haitalliset merit??hdet ja palauttaa Grand Canyonin entiseen loistoonsa?
', 8);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Apinoiden vuosi','Pankaj Gaila',80.00, 'img_23.png','Pys??ytt??m??t??n virus on tuhonnut maailman sellaisena kuin me sen tunnemme.
Vuosi on 2100. Lontoo on kostea paikka, jota hallitsevat apinat. Aikaisemmin upea Sikstuksen kappeli on nyt homehtunut.
Uskomaton yksityisetsiv??, Madame Kate Doop on ihmiskunnan ainoa toivo. Kate l??yt???? sis??isen rauhan ja perustaa salaisen vallankumouksellisen j??rjest?? nimelt?? The Freedom Fighters.
Taistelu vaarantuu, kun keskim????r??inen kirjailija, rouva Helen Raymond, huijaa Katea ja ampuu h??nt?? reiteen.
Ripustimilla ja r??pyl??ill?? varustetut vapauden taistelijat yritt??v??t parhaansa mukaan pelastaa ihmiskunnan, mutta voivatko he voittaa haitalliset apinat ja palauttaa Sikstuksen kappelin entiseen loistoonsa?
', 8);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Totuus','Danai Gizem',109.00, 'img_24.png','Zombie-apokalypsi on tuhonnut maailman sellaisena kuin me sen tunnemme.
Vuosi on 2080. New York on kapitalistinen paikka, jota hallitsevat fasistit. Aikaisemmin upea, Lontoon Tower on nyt r??yhke??.
Hyveellinen puutarhuri, tohtori Sophia Godfrey on ihmiskunnan ainoa toivo. Sophia valaistuu ja perustaa rauhanomaisenn vallankumouksellisen organisaatio nimelt?? Z.
Taistelu vaarantuu, kun Sophia huijataan ja hallitseva kauppias DI Cuthbert Bishop katkaisee verisesti h??nen varpaankyntens??
Dragondildoilla ja sporkeilla varustettu Z yritt???? parhaansa mukaan pelastaa ihmiskunnan, mutta pystyv??tk?? he voittamaan hallitsevat fasistit ja palauttamaan Lontoon Towerin entiseen loistoonsa?
', 8);

INSERT INTO `asiakas`(`astunnus`, `username`, `asnimi`, `salasana`, `puhelinro`, `osoite`, `postitmp`, `postinro`, `maa`) 
    VALUES ('1', 'jman','joonas','auto','123','talakuja','oulu','91800','suomi');

INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Jenni Juurikka', 'Oulu', 'ty??ntekij??');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Joonas Mankisenmaa', 'Oulu', 'ty??ntekij??');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Joanna Turunen', 'Oulu', 'ty??ntekij??');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Valeria Velichko', 'Oulu', 'ty??ntekij??');



    create table aukiolo (
    paiva varchar(20),
    auki varchar(5),
    kiinni varchar(5)
);

INSERT INTO `aukiolo`(`paiva`, `auki`, `kiinni`) VALUES ('MA','7:00','18:00');
INSERT INTO `aukiolo`(`paiva`, `auki`, `kiinni`) VALUES ('TI','7:00','18:00');
INSERT INTO `aukiolo`(`paiva`, `auki`, `kiinni`) VALUES ('KE','7:00','18:00');
INSERT INTO `aukiolo`(`paiva`, `auki`, `kiinni`) VALUES ('TO','7:00','18:00');
INSERT INTO `aukiolo`(`paiva`, `auki`, `kiinni`) VALUES ('PE','7:00','18:00');
INSERT INTO `aukiolo`(`paiva`, `auki`, `kiinni`) VALUES ('LA','10:00','16:00');
INSERT INTO `aukiolo`(`paiva`, `auki`, `kiinni`) VALUES ('SU','12:00','15:00');

