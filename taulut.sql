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

INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Christian ja Judith','Marcus Barnes',5.00, 'img_1.png','Christian Ramsbottom on komea, hoikka ja rohkea lakimies Ohiosta. Hänen elämänsä ei mene mihinkään, kunnes hän tapaa Judith Parkerin, kuuman, kalpean naisen, jolla on intohimo ruoanlaittoon.
Christian ei välitä välittömästi Judithista ja ajattelemattomista ja ylimielisistä tavoista, jotka hän on oppinut vuosiensa aikana Euroopassa.
Kuitenkin, kun vampyyri yrittää ryöstää Christiania,Judith lähtee auttamaan. Christian alkaa huomata, että Judith on itse asiassa melko hyveellinen.
Mutta Judithin yksityisetsivänä tekemät paineet jättävät hänet sokeaksi Christianin kiintymyksille, ja Christian aloittaa lukemisen yrittääkseen häiritä itseään.
Lopuksi, kun kontrolloiva psykiatri Harold Chan, uhkaa tulla heidän väliinsä, Judithin on toimittava nopeasti. Mutta löytävätkö he koskaan ansaitsemansa kiihkeän rakkauden?
', 1);
INSERT INTO `tuote`( `name`, `author`, `price`, `image`,`description`, `category_id`) VALUES ('Sitten tuli Mo','Lavina Coenraad',4.00, 'img_2.png','Zach Torrance on lyhyt, ohut ja intuitiivinen mekaanikko Englannista. Hänen elämänsä ei mene mihinkään, kunnes hän tapaa Mo Smithin, karvaan, kuuman miehen, jolla on intohimo hillomonttuja kohtaan.
Zach ei välitä välittömästi Moista ja hänen huijaavista ja kylmäverisistä tavoista, jotka hän oppi Englannissa.
Kuitenkin, kun joukkomurhaaja yrittää kuristaa Zachia, Mo lähtee apuun. Zach alkaa huomata, että Mo:lla on itse asiassa melko ystävällinen sydän.
Mutta Mo: n kirjoittajan paineet jättävät hänet sokeaksi Zachin kiintymyksille, ja Zach ryhtyy postimerkkien keräämiseen yrittääkseen häiritä itseään.
Lopuksi, kun itsekäs kirjailija Joshua Rockatansky uhkaa tulla heidän välilleen, Mo: n on toimittava nopeasti. Mutta löytävätkö he koskaan ansaitsemansa syvän rakkauden?
', 1);
INSERT INTO `tuote`( `name`, `author`, `price`, `image`,`description`, `category_id`) VALUES ('Joku kuten Kathy','Nirav Samo',49.00, 'img_3.png','Annabelle Nolan on pörröinen, kaunis ja maanläheinen tietokoneohjelmoija kaupungista. Hänen elämänsä ei mene mihinkään, ennen kuin hän tapaa Kathy Khanin, kuuman, hoikkaan naisen, jolla on intohimo musiikkiin.
Annabelle ei välitä heti Kathysta ja hänen hämmentyneistä ja juonittelevista tavoista, jotka hän on oppinut vuosiensa aikana kaupungissa.
Kuitenkin, kun leijona yrittää hyökätä Annabellen kimppuun, Kathy lähtee pelastamaan. Annabelle alkaa huomata, että Kathy on itse asiassa melko vaatimaton.
Mutta Kathyn kalamyymälän paineet jättävät hänet sokeaksi Annabellen kiintymyksille ja Annabelle ryhtyy golfiin kokeilemaan itseään.
Lopuksi, kun tahditon mekaanikko Sandie DeVito uhkaa tulla heidän väliinsä, Kathyn on toimittava nopeasti. Mutta löytävätkö he koskaan ansaitsemansa lihavan rakkauden?
', 1);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Hopeisen pianon kirous','Jessica Andrews',34.00, 'img_4.png','Tutkiessaan paikallisen navigaattorin kuolemaa suloinen siivooja nimeltä Sophia Zeus paljastaa legendan yliluonnollisesti kirotusta hopeapianosta, joka kiertää kaikkialla Kanadassa. Heti kun joku soittaa pianoa, hänellä on elää täsmälleen 90 päivää.
Harvat tuomitut näyttävät olevan tavallisia ihmisiä päivittäisessä elämässä, mutta kuvatessaan ne näyttävät harmailta. Merkitty henkilö tuntuu omituiselta kissanpennulta.
Sophia saa käsiinsä pianon, kieltäytymättä uskomasta taikauskoa. Hänen mieleensä vilkkuu kuvakollaasi: taaksepäin kiipeävä koala, joka tasapainottaa tungosta navigaattorissa, vanha sanomalehden otsikko pyöräilyonnettomuudesta, hupullinen mäyrä, joka hämmentää varpaita, ja harmaassa paikassa sijaitseva juomakaivo.
Kun Sophia huomaa silmäripsien olevan kissanpennun silmäripsien kaltaisia, hän tajuaa, että hopeapianon kirous on totta, ja kutsuu ystävänsä, kalastaja Harold Superhalkiksi, auttamaan.
Harold tutkii pianoa ja alistuu mielellään kiroukseen. Hän huomaa, että samat näkymät vilkkuvat hänen silmänsä edessä. Hän pitää taaksepäin kiipeävää koalaa tasapainottamassa tungosta navigaattorissa erityisen viilentävänä. Hän liittyy yliluonnollisen kuoleman jonoon.
Sophia ja Harold pyrkivät paljastamaan visioiden merkityksen aloittamalla hupullisen mäyrän etsinnän. Pystyvätkö he lopettamaan kirouksen ennen kuin heidän aikansa on loppunut?
', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Kadonnut veljen poika','Pilar Michaela',93.00, 'img_5.png','Eräänä aamuna pimeässä talossaan Kentissä, Rachel Gump avaa veljenpoikansa Steve Jonesin lahjan, ja Rachel tietää, että heidän elämänsä ei tule koskaan olemaan enää samanlainen.
Yrittäessään rakentaa elämäänsä Rachel todistaa murhan, joka saa hänet kyseenalaistamaan uuden ystävyytensä. Hänelle tulee pakkomielle salaperäiseen muukalaiseen Zoe Zeuseen. Mikä on Zoen yhteys Steveen, ja miksi hän on nyt tullut paikalle?
Rachelin käyttäytyminen muuttuu yhä epävakaammaksi, kun hän yrittää selvittää totuuden ja kalmarin pianon merkityksen taistellessaan samalla selviytyäkseen kroonisesta väsymysoireyhtymästä.
Joka päivä Rachel lähestyy totuutta. Ja mitä lähemmäksi hän tulee, sitä kauhistuttavalta se näyttää.
', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Raadeltu banaani','Saku Dobromil',94.00, 'img_6.png','Viehättävässä Sludgesiden rannikkokaupungissa on salaisuus.
Jeff Greenwaylla on täydellinen elämä, kun hän työskentelee asianajajana kaupungissa ja ui merkittävän tyttöystävänsä Marion Plumbin kanssa.
Kuitenkin, kun hän löytää repeytyneen banaanin kellaristaan, hän alkaa ymmärtää, että asiat eivät ole aivan niin kuin ne näyttävät olevan Greenway-perheessä.
Baari-micva jättää Jeffille hämmästyttäviä kysymyksiä menneisyydestään, ja hän lähtee idylliseen Sludgesideen etsimään vastauksia.
Aluksi Sludgesiden asukkaat ovat suloisia ja upeita. Häntä kiehtoo utelias rohkea yksityisetsivä Una Malkovich. Kuitenkin, kun Jeff on tutustuttanut hänet kovaan vaseliiniin, hän joutuu hitaasti taipumaan toisena henkilönä esiintymisen, ilkivallan ja ehkä jopa julmuuden verkkoon.
Voiko Jeff vastustaa Una Malkovichin hurmaa ja paljastaa repeytyneen banaanin salaisuuden, ennen kuin on liian myöhäistä, vai tuleeko hänen kuolemastaan jälleen yksi Sludgeside-legenda?
', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Ruhjotut kädet','Iris Hawkins',10.00, 'img_7.png','Ruhjotut kädet ovat kääntyneet ympäri New Yorkia, ja asukkaat ovat peloissaan. Kymmenen murhaa kymmenessä viikossa, jotka kaikki on tehty veitsellä, eikä kenelläkään ole aavistustakaan kuka taktiton tappaja on.
Herra Brad Bishop on heikko ja hauska poliisi, joka rakastaa ruoanlaittoa. Hän ei vielä tiedä sitä, mutta hän on ainoa, joka pystyy pysäyttämään säälimättömän tappajan.
Kun hänen rakastajansa, Richard Godfrey, siepataan, herra Bishop huomaa olevansa heitetty tutkimuksen keskelle. Hänen ainoa vihje on hopeahattu.
Hän pyytää intuitiivisen etsivän, Annie McCallisterin, apua.
Voiko McCallister auttaa Bradia voittamaan sokeririippuvuutensa ja löytämään vastaukset, ennen kuin taktitonnen tappaja ja hänen tappava veitsensä lakkoavat uudelleen?
', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Lumottu ase','Svanhild Gil',50.00, 'img_8.png','Meluisassa englantilaisessa Glasgow:n kaupungissa on salaisuus.
Catherine Thunderillä on täydellinen elämä työskennellessään psykiatrina kaupungissa ja hyrryttäen vakaan tyttöystävänsä Kimberly Khanin kanssa.
Kuitenkin, kun hän löytää kellaristaan pienen voileivän, hän alkaa ymmärtää, että asiat eivät ole aivan niin kuin Thunderin perheessä näyttää.
Rave jättää Catherinen hämmästyttäviin kysymyksiin menneisyydestään, ja hän lähtee etsimään Glasgowiin etsimään vastauksia.
Aluksi Glasgowin ihmiset ovat ystävällisiä ja ihailtavia. Häntä kiehtoo utelias ihastuttava opettaja Rachel Sparkle. Kuitenkin sen jälkeen, kun Catherine on tutustuttanut hänet kovaan vaseliiniin, hän hakeutuu hitaasti ahmimisen, mustasukkaisuuden ja ehkä jopa silpomisen verkkoon.
Voiko Catherine vastustaa Rachel Sparklen hurmaa ja paljastaa pienen voileivän salaisuuden, ennen kuin on liian myöhäistä, vai tuleeko hänen kuolemastaan jälleen yksi Glasgowin legenda?
', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Mennyt rakastaja','Romulo Yuna',12.00, 'img_9.png','Eräänä aamuna Australiassa sijaitsevassa talossa Pete Superhalk avaa lahjan rakastajaltaan Forest MacDonaldilta, ja Pete tietää, että heidän elämänsä ei koskaan enää ole sama.
Yrittäessään rakentaa elämäänsä Pete todistaa rikoksen, joka saa hänet kyseenalaistamaan uuden suhteen. Hänelle tulee pakkomielle arvoituksettoman muukalaisen Forest Lakemanin kanssa. Mikä on hänen yhteys Forestiin, ja miksi hän on ilmestynyt nyt?
Peten käyttäytyminen muuttuu yhä epävakaammaksi, kun hän yrittää selvittää haalistuneen veitsen totuuden ja merkityksen taistellessaan unettomuuden torjumiseksi.
Joka päivä Pete lähestyy totuutta. Ja mitä lähemmäksi hän tulee, sitä epätodennäköisemmältä se näyttää.
', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Galaktiset intohimoiset kynttilänjalka sodat','Lorenzo Martin',21.00, 'img_10.png','Kauan, kauan sitten intohimoisessa galaksissa ...
Lähdettyään kostealta maapallolta, jättiläisiä lentää kohti kaukaista pilkkua. Pilkku hajoaa vähitellen jäätyneeksi avaruusasemaksi.
Sisällissota iskee galaksiin, jota hallitsee vaalea velho Josh Bishop, joka kykenee kaikenlaiseen julmuuteen.
Kauhuissaan Shane Pittinä tunnettu kaunis lohikäärme joutuu pakenemaan imperiumia suojelijansa Dolly Bondin kanssa.
He suuntaavat Los Angelesiin Neptunuksen planeetalla. Kun he vihdoin saapuvat, puhkeaa taistelu. Bond käyttää intohimoista kynttilänjalkaaan puolustamaan Shanea.
Bondin on taisteltava pelastamaan Dragon Shane, mutta kun hän vahingossa paljastaa huolettoman terän, intohimoisen, kostean galaksin koko tulevaisuus on vaakalaudalla.
', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Pienet pistoolisodat','Jasmin Cynthia',78.00, 'img_11.png','Kauan, kauan sitten pienen pienellä planeetalla ..
Lähdettyään kuumalta maaplaneetaltaan joukko zombieta lentää kohti loistavaa täplää. Täplä hajoaa vähitellen mutkikkaaksi avaruuskorkeudeksi.
Sisällissota pieksee galaksia, jota hallitsee mo grey, paisuva keiju, joka kykenee ahmimaan ja jopa murhaamaan.
Kauhuissaan ruskea zombi, joka tunnetaan nimellä Naomi Smart, pakenee imperiumia avustajansa Charity Parkerin kanssa.
He suuntaavat Falmouthiin Scoboni-planeetalla. Kun he vihdoin saapuvat, puhkeaa verinen taistelu. Parker käyttää vähäpistooliaan Naomin puolustamiseen.
Parker ja Zombie Naomi päättävät, että on aika lähteä Scobonista ja varastaa auto.
He kohtaavat robottien heimon, jotka vangitsevat zombin ja pyrkivät viemään hänet takaisin Falmouthiin.
Parkerin on taisteltava pelastaakseen Zombie Naomi, mutta kun hän vahingossa kaivaa esiin kauniin veitsen, vaarana on koko pienen planeetan tulevaisuus.
', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Vaaleanpunainen köysi','Viola Hormizd',100.00, 'img_12.png','Ei niin kauaa sitten vaaleanpunaisessa galaksissa ...
Lähdettyään ruuhkaiselta Tatooine-planeetalta joukko ulkomaalaisia lentää kohti kaukaista pinkkiä pilkkua. Pilkku hajoaa vähitellen leveäksi avaruudeksi.
Sota repi pinkkiä galaksia, jota hallitsi Jack DeVito, villi pixie, joka kykenee esiintymään ja jopa sieppaamaan.
Kauhuissaan kaupunkilohikäärme, joka tunnetaan nimellä Suzanne Walker, pakenee imperiumia isäntänsä Chantal Hemingwayn kanssa.
He suuntaavat Ylä-Boggingtoniin Epsilon Eridani-planeetalle. Kun he vihdoin saapuvat, puhkeaa erimielisyys. Hemingway käyttää vaaleanpunaista köyttä Suzannen puolustamiseen.
Hemingway ja Dragon Suzanne päättävät, että on aika lähteä Epsilon Eridanista ja varastaa mopo ja pari asetta.
He kohtaavat ihmisten heimon. Miehet vangitsevate Hemingwayn ja lohikäärmeen, sekä vievät heidän takaisin Ylä-Boggingtoniin.
Hemingwayn on taisteltava pelastaakseen Dragon Suzanne, mutta kun hän vahingossa kaivaa esiin ruskean kiven, vaakalaudalla on koko vaaleanpunaisen ja tunkkasen galaksin tulevaisuus.
', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Viimeinen fantasia','Shiva Anderws',49.00, 'img_13.png','Talossa asui kostea ja täyteläinen lohikäärme nimeltä Harriet Bond. Ei piikikäs,mutta herkkä ja idyllinen talo, täynnä housuja ja aurinkoisia hajua, eikä silti ruskea, kaareva, hiljainen talo, jossa ei ole missä istua tai syödä: se oli lohikäärmemökki, ja se tarkoittaa lämpöä.
Eräänä päivänä, pixie Flora Gloopin huolestuttavan vierailun jälkeen Harriet lähtee talostaan etsimään kolmea karvaista makkaraa. Tehtävä, joka toteutetaan nuoren ja pahan goblinin seurassa.
Etsitessään pixie-vartioituja makkaroita Harriet Bond yllättää jopa itsensä älykkyydellään ja taidollaan kirjoittajana.
Matkansa aikana Harriet pelastaa taskulampun, Floralle kuuluvan perinnön. Mutta kun Flora kieltäytyy kokeilemasta juhlia, heidän ystävyytensä on ohi.
Flora on kuitenkin haavoittunut Ison-Britannian taistelussa ja molemmat sopivat juuri ennen kuin Harriet ryhtyy vakaviin juhliin.
Harriet hyväksyy yhden kolmesta karvaisesta makkarasta ja palaa taloonsa hyvin varakkaana lohikäärmenä.
', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Keijukainen, Reginald Greenway','Linus Jemma',38.00, 'img_14.png','Mökissä asui raidallinen, juonitteleva keijukainen nimeltä Reginald Greenway. Ei huolestuttava, mutta kuohuva ja runsas mökki, joka on täynnä kolikoita ja yksinkertaisia hajuja ja joka ei siltikään jäinen, pahaa tarkoittava taikka hiljainen mökki, jossa ei ole missä istua tai  mitään syödä: se oli keijukais-kota, ja se tarkoitti mukavuutta .
Eräänä päivänä, Helin Hemingwayn huolestuttavan vierailun jälkeen, Reginald lähtee mökistään ja suuntaa etsimään kolmea täplärobottia. Tehtävä on suoritettava velhojen, jättiläisten ja ääliö-nuorten seurassa.
Reginald Greenway löytää itsensä kärsivällisyydellään ja taidoillaan kampaajana.
Matkansa aikana Reginald pelastaa terän, Helenille kuuluvan perinnön. Mutta kun Helen kieltäytyy kokeilemasta boppingia, heidän ystävyytensä on ohi.
Helen on kuitenkin haavoittunut Waterloon taistelussa ja molemmat sopivat juuri ennen Reginaldin ryhtymistä vakavaan hyppäämiseen.
Reginald hyväksyy yhden kolmesta täplärobootista ja palaa mökkiinsä hyvin köyhänä keijukaisena.
', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Hirven uni','Ingrid Valentinus',104.00, 'img_15.png','Kuopassa asui pullea, ruskea hirvi nimeltä Alex Cockle. Kuoppa ei ollut viehättävän idyllinen eikä siinä ollut sensaatiomaista, punaista, villiä tillaa jossa olisi voinut nukkua.Mutta se oli kuitenkin hirvikuoppa, mikä tarkoitti suojaa.
Aave Lauren Randallin epäilyttävän vierailun jälkeen, Alex lähtee kuopastaan ja yrittää löytää kolmea meluisaa hurmaa. Tehtävä on suoritettava pahojen noitien ja keijujen kanssa.
Alex Cockle etsii haamuvarastettuja hurmaa ja matkallaan löytää itsestään ystävällisyyden ja salaisen taidon tietokoneohjelmointiin.
Matkansa aikana Alex pelastaa makkaran, Laurenin perinnön. Mutta kun Lauren kieltäytyy kokeilemasta lenkkeilyä, heidän ystävyytensä on ohi.
Lauren on kuitenkin haavoittunut Blenheimin taistelussa ja kaksi sopivat juuri ennen kuin Alex ryhtyy vakavaan lenkkeilyyn
Alex hyväksyy yhden kolmesta meluisasta hurmasta ja palaa kotiin kuoppaansa tyytyväisenä.
', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Doris ja Tometta - Sharfootin peikonmetsästäjät','Lesley Ferrari Gordon',27.00, 'img_16.png','Doris Barlow on vain tavallinen viisivuotias tyttö, joka asuu Sharpfootissa, kunnes hän näkee kauhistuttavan peikon, Earlobe Mudbather, kiipeävän sisään makuuhuoneen ikkunasta.
Earlobe, joka on rakennettu kuin kiviä täynnä oleva peruna ja joka haisee kuin raastetut rotton-nauriit, jotka on tukahdutettu roskakorista valmistetulla kastikkeella, laulaa laulun pienistä tytöistä.
Doris huijaa peikkoa putoamaan ulos ikkunastaan kertomalla hänelle, että ulkona on lasten aivojen juustoleipiä. Hän tajuaa, että peikko on lopetettava, ennen kuin hän syö enemmän lapsia ja ryhtyy töihin yrittäen keksiä ansan.
Samaan aikaan luolassa aivan Sharpfootin ulkopuolella Tometta Stink alkaa epäillä, että lasten syöminen on väärin, ja kyllästyy metsästämään muiden peikkojen kanssa. Hän päättää elää kasvissyöjänä.
Lyhyen väärinkäsityksen jälkeen, johon sisältyi ketsupin jalka ja sidokset, Doris ja Tometta ryhtyvät pysäyttämään peikot, käyttäen herneitä ampuvaa katapulttia. He houkuttelevat peikkoja luomalla suuren armeijan skunk-kouluttajia.
', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Charity ja Slug – Earwax Cityn sankarit','Mijo Sosimo',37.00, 'img_17.png','Charity Parkes on uniikki seitsemänvuotia tyttö, joka asuu Earwax Cityssä, kunnes hän näkee kammottavan peikon, Christian Greentonguen, kiipeävän sisään savupiipusta.
Christian, joka näyttää kuin kiviä täynnä olevalta perunalta ja joka tuoksuu raastetuilta haisevilta kengiltä,  laulaa laulun pienten tyttöjen tekemisestä juustoleivistä.
Hyväntekeväisyys huijaa peikon putoamaan ikkunasta.Pudottuaan, hän tajuaa, että peikko on lopetettava, ennen kuin hän syö enemmän lapsia ja ryhtyy töihin yrittäen keksiä ansan.
Lyhyen väärinkäsityksen jälkeen, johon liittyy pieni sormi ja ketsupin rutistaminen, Charity ja hänen rohkea etanansa,Slug ryhtyvät pysäyttämään peikot, käyttämällä katapulttia, joka ampuu porkkana paloja. He houkuttelevat peikkoja luomalla suuren läjän haisevia kenkiä.
', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Garyn salaisuus','Hadubert Photina',107.00, 'img_18.png','West Bogginsissa on utelias uusi poika, ja kaikki puhuvat hänestä. Hämmästyttävän karvainen ja tuhoisasti villi, kaikki pojat haluavat ystävystyä hänen kanssaan. Gary MacDonaldilla on kuitenkin salaisuus - hän on pelottava vampyyri.
Tommy Randall on lempeä, ohut poika, joka nauttii neulomisesta. Gary herättää hänessä kiinnostuksen, sillä hän pystyy pysäyttämään kuorma-autot paljain käsin. Tommy ei ymmärrä miten Gary pystyy täilläiseen ihan itse.
Hänen paras ystävänsä, intuitiivinen hirvi nimeltä Doris, auttaa Tommyä aloittamaan palapelin kokoamisen. Yhdessä he selvittävät Garyn mysteerin.
Kun valkosipulit alkavat kääntyä ympäri West Bogginsia, Tommy alkaa pelätä pahinta. Hirvi kehottaa häntä ilmoittamaan Garystä opettajille ja hän tietää, että hänen pitäisi, joten mikä estää häntä?
Saako hän riehuvan vampyyrin kiinni?
', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Darth, vamppyyrintappaja','George King',46.00, 'img_19.png','Liverpoolissa on uusi rohkea tyttö ja hän puhuu kaikkea. Hämmästyttävän ohut ja tuhoisasti vahva, kaikki pojat haluavat häntä. Ocean Thomasilla on kuitenkin salaisuus - hän on erikoinen vampyyri.
Darth Sparrow on maanläheinen, utelias poika, joka nauttii jalkapallosta. Ocean kiehtoo häntä,koska hän pystyy pysäyttämään helikopterit paljain käsin. Hän ei ymmärrä, miksi hän on niin itsenäinen.
Hänen paras ystävänsä, huomaavainen ogre nimeltä Una, auttaa Darthia aloittamaan palapelin kokoamisen. Yhdessä he löytävät lopullisen aseen - keltaisen,lumotun partaveitsen.
Kun ruumiit alkavat kääntyä ympäri Liverpoolia, Darth alkaa pelätä pahinta. Ogre kehottaa häntä ilmoittamaan Oceanista poliisille ja hän tietää, että hänen pitäisi, joten mikä estää häntä?
Hän voi vastustaa Oceanin puremista, mutta voiko hän vastustaa hänen hurmaa?
', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Enkelin potku','Conrad Brady',77.00, 'img_20.png','Roy Fish epäili, että jokin oli hieman väärin, kun hänen kammottava sissi yritti potkia häntä vasta kuuden vuoden ikäisenä. Siitä huolimatta hän eli suhteellisen normaalia elämää muiden ihmisten keskuudessa.
Vasta kun hän törmäsi paholaisen armolliseen enkeliin, Doris Rabbitiin, hänen elämänsä alkoi lopulta olla järkevää.
Doris osoittautui kuitenkin valtavaksi ja hänellä näytti olevan epäterveellinen pakkomielle rakastamisesta. Roy sai pian tietää, että Doris oli vannonut valan,että hän ei koskaan kutittaisi ihmistä.
Kun Royn kammottava sissi loukkaantuu makkaraonnettomuudessa, Roy tajuaa, että hänen oma elämänsä on vaarassa.
Huolimatta Dorisin luontaisesta pahuudesta ja sumeista siivistä, Roy joutuu putoamaan enkelin puoleen. Vain kohtalo päättää tappaa vai suojeleeko hän häntä.
Eräänä iltana sireeni ilmestyy Royn eteen ja varoittaa häntä pimeydestä Doriksessa. Sireeni antaa Royn maagisen kynttilänjalan - ainoan aseen, joka voi voittaa armollisen enkelin.
Tuleeko Roy itsessään tappamaan ainoan olennon, joka on saanut hänet tuntemaan itsensä todella epäileväksi? (Vihje: kyllä!)
', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Salaperäinen, antava poliisi','Domitianus Cornelius',104.00, 'img_21.png','Carla Johnson on huomaavainen poliisi maagisesta Euroopasta. Hän elää idyllistä elämää. Kaikki tämä kuitenkin muuttuu, kun Carla varaa kesäloman autioon Camborneen.
Aluksi Carla pitää Cambornea hyvin unisena. Sitten salaperäinen, antava mekaanikko Gregory Willis, saa hänet epäiemään.
Kun Gregory kutsuu hänet keskusteluretkelle, Carla alkaa ymmärtää, että Gregory on syvästi rohkea ja juonitteleva mies
Carla tietää sydämessään, että Gregory on mies hänelle. Auttaakseen onneaan Carlan täytyy kuitenkin torjua juonitteleva mekaanikko Toby Chan, joka haluaa saada upotettua kyntensä Gregoryyn.
Käyttämällä väkivaltaista keittoa ja molemminpuolista rakkautta musiikkiin Carla aikoo ryöstää Gregoryn lopullisesti. Mutta palauttaako antava poliisi kiintymyksensä?
', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('2033, Meritähden vuosi','Parthalan Duha',67.00, 'img_22.png','Supervirus on tuhonnut maailman sellaisena kuin me sen tunnemme.
Vuosi on 2033. Kanada on jäätynyt paikka, jota hallitsee meritähti. Aikaisemmin loistava Grand Canyon on nyt kivinen.
Riemukas mekaanikko, rouva Polly Nolan on ihmiskunnan ainoa toivo. Polly löytää rohkeuden perustaa salainen vallankumouksellinen järjestö nimeltä Seitsemän sutta.
Taistelu vaarantuu, kun ilkeä asianajaja Lord Barry Bishop huijaa Pollyä ja loukkaa hänen vasemman silmänsä.
Aseilla, äly- ja happisäiliöillä Seitsemän sutta yrittää parhaansa pelastaa ihmiskunnan, mutta voivatko he voittaa haitalliset meritähdet ja palauttaa Grand Canyonin entiseen loistoonsa?
', 8);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Apinoiden vuosi','Pankaj Gaila',80.00, 'img_23.png','Pysäyttämätön virus on tuhonnut maailman sellaisena kuin me sen tunnemme.
Vuosi on 2100. Lontoo on kostea paikka, jota hallitsevat apinat. Aikaisemmin upea Sikstuksen kappeli on nyt homehtunut.
Uskomaton yksityisetsivä, Madame Kate Doop on ihmiskunnan ainoa toivo. Kate löytää sisäisen rauhan ja perustaa salaisen vallankumouksellisen järjestö nimeltä The Freedom Fighters.
Taistelu vaarantuu, kun keskimääräinen kirjailija, rouva Helen Raymond, huijaa Katea ja ampuu häntä reiteen.
Ripustimilla ja räpylöillä varustetut vapauden taistelijat yrittävät parhaansa mukaan pelastaa ihmiskunnan, mutta voivatko he voittaa haitalliset apinat ja palauttaa Sikstuksen kappelin entiseen loistoonsa?
', 8);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `description`, `category_id`) VALUES ('Totuus','Danai Gizem',109.00, 'img_24.png','Zombie-apokalypsi on tuhonnut maailman sellaisena kuin me sen tunnemme.
Vuosi on 2080. New York on kapitalistinen paikka, jota hallitsevat fasistit. Aikaisemmin upea, Lontoon Tower on nyt röyhkeä.
Hyveellinen puutarhuri, tohtori Sophia Godfrey on ihmiskunnan ainoa toivo. Sophia valaistuu ja perustaa rauhanomaisenn vallankumouksellisen organisaatio nimeltä Z.
Taistelu vaarantuu, kun Sophia huijataan ja hallitseva kauppias DI Cuthbert Bishop katkaisee verisesti hänen varpaankyntensä
Dragondildoilla ja sporkeilla varustettu Z yrittää parhaansa mukaan pelastaa ihmiskunnan, mutta pystyvätkö he voittamaan hallitsevat fasistit ja palauttamaan Lontoon Towerin entiseen loistoonsa?
', 8);

INSERT INTO `asiakas`(`astunnus`, `username`, `asnimi`, `salasana`, `puhelinro`, `osoite`, `postitmp`, `postinro`, `maa`) 
    VALUES ('1', 'jman','joonas','auto','123','talakuja','oulu','91800','suomi');

INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Jenni Juurikka', 'Oulu', 'työntekijä');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Joonas Mankisenmaa', 'Oulu', 'työntekijä');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Joanna Turunen', 'Oulu', 'työntekijä');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Valeria Velichko', 'Oulu', 'työntekijä');



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

