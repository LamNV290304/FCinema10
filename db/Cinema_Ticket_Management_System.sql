-- CREATE DATABASE
CREATE DATABASE CINEMA_TICKET_MANAGEMENT_SYSTEM
GO
USE CINEMA_TICKET_MANAGEMENT_SYSTEM
--DROP DATABASE CINEMA_TICKET_MANAGEMENT_SYSTEM

--CREATE TABLE 



-- Table: cinemas
CREATE TABLE cinemas (
    cinema_id INT identity(1, 1) PRIMARY KEY,
    cinema_name VARCHAR(255) NOT NULL,
    cinema_address VARCHAR(255) NOT NULL
);

-- Table: room
CREATE TABLE room (
    room_id INT PRIMARY KEY,
    cinema_id INT NOT NULL,
    room_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(cinema_id)
);

-- Table: movies
CREATE TABLE movies (
    movie_id INT identity(1, 1) PRIMARY KEY,
	movie_poster varchar(255),
    movie_name VARCHAR(255) NOT NULL,
    movie_description TEXT,
    movie_trailer VARCHAR(255),
    movie_actress VARCHAR(255),
    movie_genres VARCHAR(255),
    movie_release DATE,
    movie_length VARCHAR(255),
    movie_director VARCHAR(255)
);


CREATE TABLE run_time(
	run_time_id INT PRIMARY KEY NOT NULL,
	time_start TIME NOT NULL,
	time_end TIME NOT NULL,
);


-- Table: schedule
CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    room_id INT NOT NULL,  
	schedule_date DATE NOT NULL,
	run_time_id INT
	FOREIGN KEY (run_time_id) REFERENCES run_time(run_time_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);


-- Table: seats
CREATE TABLE seats (
    seat_id INT not null,    
    room_id INT NOT NULL,
    seat_name varchar(255),
	run_time_id INT not null,
	status bit DEFAULT 0,
    FOREIGN KEY (room_id) REFERENCES room(room_id),
	FOREIGN KEY (run_time_id) REFERENCES run_time(run_time_id)
);

-- Table: users
CREATE TABLE users (
    user_id INT identity(1, 1) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
	avatar varchar(255),
	role VARCHAR(10) NOT NULL,
    fullname nVARCHAR(255),
    birthday DATE,
    gender nvarchar,
    email VARCHAR(255),
    city VARCHAR(255),
    phone VARCHAR(50)
);



-- Table: booking
CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
);

--table: booking detail
CREATE TABLE booking_detail (
    booking__detail_id INT PRIMARY KEY,
    booking_id INT,
    schedule_id INT NOT NULL,
    seat_name varchar NOT NULL,
	room_id INT NOT NULL,
	FOREIGN KEY (room_id) REFERENCES room(room_id),
	FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
	FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id)
);


create table Food (
	food_id int identity(1, 1) primary key,
	food_name nvarchar(50) not null,
	describe nvarchar(100) not null,
	price int not null
);

-- INSERT DATA TO DATABASE
INSERT INTO cinemas (cinema_name, cinema_address)
VALUES
    ('F Ha Noi', 'Ha Noi'),
    ('F Ho Chi Minh', 'Ho Chi Minh City'),
    ('F Da Nang', 'Da Nang'),
    ('F Hai Phong', 'Hai Phong'),
    ('F Can Tho', 'Can Tho'),
    ('F Nha Trang', 'Nha Trang'),
    ('F Hue', 'Hue'),
    ('F Hai Duong', 'Hai Duong'),
	('F Hung Yen', 'Hung Yen');


--INSERT ADMIN
INSERT INTO users(username,password,role)
VALUES('admin1','root1','admin'),
	  ('admin2','root2','admin'),
	  ('admin3','root3','admin');
--INSERT EMPLOYEE
INSERT INTO users(username,password,role)
VALUES('employee01','123456789','employee')

INSERT INTO users(username,password,role)
VALUES('user1','123456789','user')

--INSERT MOVIE
INSERT INTO	movies(movie_poster,movie_name,movie_description,movie_trailer,movie_actress,movie_genres,movie_release,movie_length,movie_director)
VALUES ('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/d/m/dm4_posterminion_700x1000.jpg','DESPICABLE ME 4',
'Gru is facing a new enemy, Maxime Le Mal and Valentina is plotting revenge against him, forcing his family to flee elsewhere. Alongside the struggle to protect his family, Gru must also find common ground with the newest member of the household, Gru Jr.',
'https://www.youtube.com/embed/S1dnnQsY0QU?rel=0&showinfo=0','Steve Carell, Kristen Wiig, Joey King', 'Adventure, Animation, Comedy', '7/5/2024','94 minutes','Chris Renaud, Patrick Delage'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/a/q/aqpd1_teaser_glass_470x700.jpg','A QUIET PLACE: DAY ONE',
'Experience the day the world went quiet.','https://www.youtube.com/embed/9wVj8AxpT8A?rel=0&showinfo=0','Joseph Quinn, Alex Wolff, Djimon Hounsou','Horror','6/28/2024','99 minutes 17 seconds','Michael Sarnoski'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/1/0/1080x1350-insideout.jpg','INSIDE OUT 2',
'Cuộc sống tuổi mới lớn của cô bé Riley lại tiếp tục trở nên hỗn loạn hơn bao giờ hết với sự xuất hiện của 4 cảm xúc hoàn toàn mới: Lo Âu, Ganh Tị, Xấu Hổ, Chán Nản. Mọi chuyện thậm chí còn rối rắm hơn khi nhóm cảm xúc mới này nổi loạn và nhốt nhóm cảm xúc cũ gồm Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và Chán Ghét lại, khiến cô bé Riley rơi vào những tình huống dở khóc dở cười.',
'https://www.youtube.com/embed/9phK0prtuJM?rel=0&showinfo=0','(Lồng tiếng) Amy Poehler, Maya Hawke, Lewis Black, Phyllis Smith, Tony Hale, Liza Lapira, Ayo Edebiri, Adèle Exarchopoulos, Paul Walter Hauser,....','Adventure, Animation, Comedy','6/14/2024','96 minutes','Kelsey Mann'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/b/_/b_n_sao_c_a_470wx700h.jpg','TWILIGHT OF THE WARRIORS: WALLED IN',
'Lac Quan illegally entered Hong Kong and received support from Quyen Phong to survive in Kowloon Walled City - a dangerous area with numerous gangs. During a crisis, they discovered hidden rules amidst the prevailing chaos. Confronted with criminal forces, they stood up against the dark schemes of their enemies determined to uphold their vow to protect the peace of this area.',
'https://www.youtube.com/embed/4slIl4BFveI?rel=0&showinfo=0','Cổ Thiên Lạc, Hồng Kim Bảo, Nhậm Hiền Tề, Quách Phú Thành, Lâm Phong, Lưu Tuấn Khiêm, Huỳnh Đức Bân, Ngũ Doãn Long, Hồ Tử Đồng, Trương Văn Kiệt','Action','6/14/2024','124 minutes 17 seconds','Trịnh Bảo Thụy'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_opt1_gia_tai_cua_ngoai_3.jpg','HOW TO MAKE MILLIONS BEFORE GRANDMA DIES',
'A young man quits his job to look after his dying grandmother. However, it is not out of love that he assumes the role of a devoted grandson but for a substantial inheritance worth millions, going to great lengths to become the apple of his demanding grandmother’s eye before time runs out.',
'https://www.youtube.com/embed/Y_qYJ6To93k?rel=0&showinfo=0','Putthipong Assaratanakul (Billkin), Usha Seamkhum, Tontawan Tantivejakul,…','Drama','6/7/2024','127 minutes','Pat Boonnitipat'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/3/5/350x495-ncq.jpg','MYSTERY WRITERS',
'The 4th floor of the building was "swallowed up" by flames and abandoned long ago. However, rumors about the red dress ghost and horrifying deaths here continuously make residents live in extreme fear.',
'No trailer','Esther Huang; Yuu Chen; Yukan Temu','Horror','7/5/2024','83 minutes','Chih-Wen Hsieh'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/3/5/350x495-mhdn.jpg','MÙA HÈ ĐẸP NHẤT',
'"Mùa hè năm ấy, chúng ta chẳng có gì trong tay ngoài tuổi trẻ, ước mơ, và…có nhau. Nhưng cũng chính mùa Hè ấy - mùa hè mang theo những điều mà ta chưa kịp hoàn thành…Bạn đã sẵn sàng gặp lại phiên bản của chính mình, trong những ngày Hè đẹp nhất của tuổi trẻ năm ấy và viết tiếp câu chuyện còn dở dang chưa?"',
'https://www.youtube.com/embed/ZOPt6QHHbh8?rel=0&showinfo=0','Đỗ Khánh Vân, Trần Nghĩa, Công Dương, Minh Dự, Nguyễn Tụ','Drama','6/28/2024','118 minutes','Vũ Khắc Tuận'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/a/b/abl-main-poster_1_.jpg','A BALLOON^S LANDING',
'Hong Kong writer Thiên Vũ traveled alone to Taipei to search for the Whale Bay - a mysterious place that, according to a letter from a friend, could lead to paradise. During his trip, he unexpectedly met a kind local man named A Tường, who brought many emotions to Thiên Vũ. Although they had promised to search for the Whale Bay together, A Tường suddenly disappeared after the Kenting fireworks festival. Realizing that their previous meeting was fate, Thiên Vũ is determined to find A Tường and always hopes to meet him again.',
'https://www.youtube.com/embed/mBx68k8Ae9Y?rel=0&showinfo=0','Terrance Lau, Fandy Fan, Chan Tzu Hsuan, Allison Lin','Romance','6/28/2024','100 minutes','Angel Teng'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/3/5/350x495-hktss.jpg','UNDER PARALLEL SKIES',
'A man struggling with a painful past tries to move forward, only to discover that the woman in his present life has an uncanny connection to his past.',
'https://www.youtube.com/embed/cdrG6qXCrFY?rel=0&showinfo=0','Metawin Opas-Iamkajorn, Janella Salvador','Romance','6/28/2024','110 minutes','Sigrid Andrea Bernardo'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/d/r/drm24_-_poster.jpg','DORAEMON THE MOVIE: NOBITA"S EARTH SYMPHONY',
'"FUJIKO F FUJI 90TH ANNIVERSARY
A mysterious girl, Micca, appears in front of Nobita, who is practicing his recorder for the school concert. She likes the laid-back tones that Nobita plays, so Mikka invites Doraemon, Nobita, and the others to the Hall of Music (Fare), which was created on a planet where music is energy. Mikka was looking for a musical master to play the music he needed to revive the Hall of Fare. Doraemon and his friends use the secret tool to play music to revive the Hall of Fame, but a creepy lifeform approaches them that erases music from the world."',
'https://www.youtube.com/embed/Yug8gbDd5EQ?rel=0&showinfo=0','Wasabi Mizuta, Megumi Ôhara, Yumi Kakazu','Animation','5/24/2024','115 minutes','Kazuaki Imai'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_tru_bat_gioi_2_1_.jpg','PIGSY',
'One day, the clumsy Bajie wished to be chosen to join the "New World," a progressive and perfect society! In a dilemma, Bajie was forced to make a secret agreement with Bull Demon King and join Tang Sanzang"s group. However, Bajie discovered that Bull Demon King was harboring a sinister plan that could take the lives of many people. What must Bajie and his teammates do to protect everyone from Bull Demon King"s scheme? Is the New World truly as perfect and desirable as it seems?',
'https://www.youtube.com/embed/EpoMV-jCDV8?rel=0&showinfo=0','Greg Han Hsu, Kuan-Ting Liu, Chung-Hua Tou, Hsin - Ling Chung, Waa Wei, Harlem Yu, Ivy Shao','Animation','6/21/2024','96 minutes','Chiu Li-Wei'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/s/o/soulmate_poster.jpg','SOULMATE (RERUN)',
'Soulmate is the story of Mi So (played by Kim Da Mi) and Ha Eun (played by Jeon So Nee) in an overlapping relationship filled with happiness, sadness, vibrations, and emotions—even separation. From the moment they first met under the elementary school"s roof, there was a special bond between the two girls. And when Ham Jin Woo (played by Byun Woo Seok) stepped in between the two, the cracks in Mi So and Ha Eun"s relationship appeared. (RERUN FROM JUN 06, 2024)',
'https://www.youtube.com/embed/tCC7hrheTR8?rel=0&showinfo=0','Kim Da-mi, Woo-Seok Byeon, Nam Yoon-Su, So-nee Jeon, Kim Soo Hyung','Drama, Thriller','6/21/2024','124 minutes','Young-Keun Min'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/3/5/350x495-haunted.jpg','HAUNTED UNIVERSITIES 3',
'Three separate stories of haunting events in Thailand"s universities. Jao Nang, Phee Take and The Invisible Shrine.',
'https://www.youtube.com/embed/yHLLH0rKA90?rel=0&showinfo=0','Siwat Jumlongkul, Pisitpol Ekaphongpisit, Awat Ratanapintha, Ponchanan Chantra, Nichaphat Chatchaipholrat, Chatchai Chinsi, Tawan Hiranyapong, Eisaya Hosuwan, Kanchit Jaichobngam,...','Horror','6/21/2024','117 minutes','Aussada Likitboonma, Sorawit Meungkeaw, Nontawat Numbenchap, Aroonakorn Pick.'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/4/0/406x600-lilyhill.jpg','TILL WE MEET AGAIN ON THE LILY HILL',
'An emotional record from the Japanese box office with 3.5 million tickets sold, the film revolves around Yuri, a high school girl who accidentally travels back to Japan 70 years ago. Here, she meets a guy named Akira who is a kamikaze. After spending days together, Yuri gradually fell in love with this boy.',
'https://www.youtube.com/embed/UGSZecdFcDY?rel=0&showinfo=0','Haruka Fukuhara, Okada Kenshi, Ito Kentaro, Deguchi Natsuki','Romance','6/21/2024','127 minutes','Yoichi Narita'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/o/f/official_poster.jpg','LOVE YOU AS THE WORLD ENDS',
'“Love You As The World Ends” follows the journey of survivors Hibiki Mimiya, who had to go through the ordeal of losing his partner Kurumi Ogasawara in the TV series the movie is based on. Along with a group of men also searching for their loved ones, Hibiki is hellbent on rescuing the only person he has left, his daughter Mirai. Mirai was kidnapped and brought to Utopia, a refuge from the zombies they call Golems. Once a beacon of hope, it’s now dilapidated with the group of researchers working on a cure huddled at the top, away from the masses.',
'https://www.youtube.com/embed/OMTOgYvmxZQ?rel=0&showinfo=0','Ryoma Takeuchi, Fumiya Takahashi, Mayu Hotta, Rihito Itagaki, Airu Kubozuka, Yuki Tachibana, Sakura Kiryu','Drama','6/21/2024','116 minutes','Shintaro SUGAwara'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/t/h/the-plot_main_poster_1717467017_1_.jpg','THE PLOT',
'"The movie opens with a series of deadly incidents that stir public opinion in South Korea. However, the truth behind these random accidents is a sophisticated ""life-swallowing trap"" set by a group of assassins who specialize in contract killings. Leading the group is Young Il (Gang Dong-won), along with associates including: advisor Jackie (Lee Mi-sook), disguise expert (Lee Hyun-woo), and intern Jum Man (Tang Jun-sang) - the youngest member of the team.
In one daring mission to eliminate a high-ranking politician, Young Il faces a series of strange and suspicious events. Realizing that he is the next target of the ""life-swallowing trap,"" Young Il finds himself in a situation where he can"t trust anyone. From there, the film unfolds into a thrilling and bloody tale of elimination."',
'https://www.youtube.com/embed/pjpKuRaL3FE?rel=0&showinfo=0','Gang Dong-won, Lee Moo-saeng, Lee Hyun-wook, Lee Mi-sook, Tang Jun-sang, Kim Hong-pa, Jung Eun-chae,...','Drama, Thriller','6/14/2024','99 minutes','Lee Yo-sup'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/1/2/1200x1800-garfield.jpg','THE GARFIELD MOVIE',
'Garfield is about to go on a wild outdoor adventure. After an unexpected reunion with his long-lost father - the cat Vic - Garfield and Odie are forced to abandon their pampered life to join Vic in a hilarious, high-stakes heist.',
'https://www.youtube.com/embed/oU7x71wB9PA?rel=0&showinfo=0','Hannah Waddingham, Chris Pratt, Samuel L. Jackson, Brett Goldstein, Cecily Strong','Adventure, Animation, Comedy','5/31/2024','101 minutes','Mark Dindal'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/3/5/350x495_4_.jpg','BAD BOYS: RIDE OR DIE',
'This Summer, the world"s favorite Bad Boys are back with their iconic mix of edge-of-your seat action and outrageous comedy but this time with a twist: Miami"s finest are now on the run.',
'https://www.youtube.com/embed/JD_LiQHlOeE?rel=0&showinfo=0','Will Smith, Martin Lawrence, Vanessa Hudgens','Action, Adventure, Comedy','6/7/2024','115 minutes','Adil El Arbi, Bilall Fallah'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/l/a/lat-mat-7.jpg','LẬT MẶT 7: MỘT ĐIỀU ƯỚC',
'Một câu chuyện lần đầu được kể bằng tất cả tình yêu, và từ tất cả những hồi ức xao xuyến nhất của đấng sinh thành',
'https://www.youtube.com/embed/_HgBbIUcylw?rel=0&showinfo=0','Thanh Hiền, Trương Minh Cường, Đinh Y Nhung, Quách Ngọc Tuyên, Trâm Anh, Trần Kim Hải','Drama, Family','4/26/2024','138 minutes','Lý Hải'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/t/o/totto-chan_-_payoff_poster_kt_facebook_-_dkkc_31.05.2024_1_.jpg','TOTTO-CHAN: THE LITTLE GIRL AT THE WINDOW',
'After initially failing to fit in at primary school, Totto Chan went to school at Tomoe Gakuen. Here, she meets special students and learns new things, even as Japan falls into war.',
'https://www.youtube.com/embed/f-tRSG3Rm5c?rel=0&showinfo=0','Liliana Ohno, Koji Yakusho, Shun Oguri, Anne Watanabe, Karen Takizawa','Animation','5/31/2024','114 minutes','Shinnosuke Yakuwa'),
	
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/4/0/406x600-peenak.jpg','PEE NAK 4',
'New Pee Nak Ghost with terrifying power. Balloon and First, as his manager, have no choice but to share the burden and prepare to join the ride into another terrifying to adventure save Min Joon.',
'https://www.youtube.com/embed/hiMCzdGSnCY?rel=0&showinfo=0','Witthawat Rattanaboonbaramee, Bhuripat Vejvongsatechawat, Phiravich Attachitsataporn','Comedy, Horror','5/27/2024','111 minutes','Phontharis Chotkijsadarsopon'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_payoff_loc_xoay_tu_than_8_1_.jpg','TWISTERS',
'Kate Cooper, a former storm chaser haunted by a devastating encounter with a tornado during her college years who now studies storm patterns on screens safely in New York City. She is lured back to the open plains by her friend, Javi to test a groundbreaking new tracking system. There, she crosses paths with Tyler Owens, the charming and reckless social-media superstar who thrives on posting his storm-chasing adventures with his raucous crew, the more dangerous the better. As storm season intensifies, terrifying phenomena never seen before are unleashed, and Kate, Tyler and their competing teams find themselves squarely in the paths of multiple storm systems converging over central Oklahoma in the fight of their lives.',
'https://www.youtube.com/embed/jwZPrbekSxI?rel=0&showinfo=0','Glen Powell, Daisy Edgar-Jones, Anthony Ramos, Kiernan Shipka,…','Action, Adventure, Thriller','7/12/2024','122 minutes','Lee Isaac Chung'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/o/h/oh_my_ghost_the_finale_-poster_-_vn.jpg','OH MY GHOST: THE FINALE',
'This new dormitory is located in the middle of beautiful nature. But what everyone doesn"t know is This area is a haven for people with sorcery, people who play games, and is full of mysteries that cannot be answered.',
'https://www.youtube.com/embed/u05-Z9qV9MY?rel=0&showinfo=0','Jaturong Phonboon, Charoenphol Onlamai,  Wiradit Srimanlaya, Channarong Khanthitao (Tick), Kanticha Chumma (Ticha), Panthipa Arunwattanachai (Pumpui), Achachriya Sritaa (Professer Tong), Champa Saenprom (Mae Champa)','Comedy, Horror','7/12/2024','109 minutes','Poj Anon'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/r/s/rsz_ld_poster.jpg','LONG DISTANCE',
'Long Distance revolves around the survival battle of astronauts Andy and Naomi. Their spacecraft is struck by an asteroid, forcing Andy to make an emergency landing on an alien planet. As their oxygen supply dwindles and their lives are in imminent danger, Andy unexpectedly picks up a signal from Naomi and must reach her location to try to survive together. Mysterious creatures keep appearing, threatening the lives of Andy and Naomi. Can they both overcome all obstacles to return to Earth?',
'https://www.youtube.com/embed/OhqYl0OcM3U?rel=0&showinfo=0','Anthony Ramos, Naomi Scott, Kristofer Hivju.','Adventure, Romance','7/12/2024','87 minutes','Josh Gordon, Will Speck.'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/p/s/ps_main-poster-koqua.jpg','PROJECT SILENCE',
'"Due to sudden deteriorating weather conditions, visibility on the Airport Bridge is severely impaired, leaving people stranded and at risk of the bridge collapsing due to a series of chain collisions and explosions. Amidst the chaos, the canine subjects ""Echo"" from the military experiment ""Project Silence,"" who were being transported in secret, break free, and all human survivors become targets of relentless attacks.
Various individuals find themselves stranded on the Airport Bridge for different reasons - a government official from the presidential office (LEE Sun Kyun) who was seeing off his daughter (KIM Su An) at the airport; a tow truck driver (JU Ji Hoon) who was on his way to a multi-collision scene; an elderly couple (MOON Sung Geun, YE Su Jeong) who were returning from a trip abroad; sisters (PARK Hee Von, PARK Ju Hyun) who missed their flights, and Dr. Yang (Kim Hie Won), the researcher responsible for Project Silence - and a desperate struggle begins for them to escape to safety."',
'https://www.youtube.com/embed/aHWtDgYo-_w?rel=0&showinfo=0','LEE Sun Kyun, JU Ji Hoon, KIM Hie Won, MOON Sung Geun, YE Su Jeong, KIM Tae Woo, PARK Hee Von, PARK Ju Hyun, KIM Su An','Action','7/19/2024','101 minutes','KIM Tae Gon'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/h/e/hello_jadoo_magic_ocean_poster_vietnam__470x700.jpg','HELLO JADOO SPECIAL: UNDER THE SEA',
'Hello Jadoo: Under The Sea is a delightful adventure story of Jadoo and her friends, unveiling a series of familiar fairy tales about the ocean, but this time told in a funny, interesting, and Choi family - style way.',
'https://www.youtube.com/embed/egIboz9LcUQ?rel=0&showinfo=0','N/A','Animation','7/19/2024','79 minutes','Son Seok Woo'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/3/5/350x395-boo.jpg','MY BOO',
'Inheriting a house, a streamer guy finds out that the mansion contains three very unruly spirits. However, thanks to poor motivation which caused him to swiftly transform this location into a spiritual site to draw tourists, as well as flirting with a lovely witch Anong"s heart.',
'https://www.youtube.com/embed/9vPcGJR2pSw?rel=0&showinfo=0','Sutthirak Subvijitra, Maylada Susri, Timethai Plangsilp…','Comedy, Romance, Thriller','7/19/2024','124 minutes','Komgrit Triwimol'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/3/5/350x495_2_.png','Deadpool 3: DEADPOOL & WOLVERINE',
'Wolverine is recovering from his injuries when he crosses paths with the loudmouth, Deadpool. They team up to defeat a common enemy.',
'https://www.youtube.com/embed/BmwqLXEB2pU?rel=0&showinfo=0','Josh Brolin, Ryan Reynolds, Morena Baccarin','Action','7/26/2024','127 minutes','Shawn Levy'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/b/p/bp_700x1000_1_.jpg','BLACKPINK WORLD TOUR [BORN PINK] IN CINEMAS',
'"BLACKPINK’s BORN PINK tour that captivated the world comes to the big screen, celebrating the group’s 8th anniversary since their debut!
Drawing an audience of 1.8 million and breaking global records for female group concert tours, experience the energy of the live performances in cinemas worldwide!
Featuring the iconic ‘Hanok’ set that has mesmerized fans and press worldwide, the film shows unprecedented production scale, presenting exclusively arranged versions of BLACKPINK’s hit songs unique to this concert and encompassing performances from Seoul’s Gocheok Dome alongside footage from further cities across the global tour.
Join us for all the exhilarating moments, premiering in over 110 countries, marking a first for a K-POP female group. Experience even more in special formats ScreenX, 4DX, and ULTRA 4DX!"',
'No trailer','Jisoo, Jennie, Rosé, Lisa','Concert','7/31/2024','N/A','N/A'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/2/4/240531_-_dc27_-_main_poster_1_.jpg','DETECTIVE CONAN THE MOVIE: THE MILLION-DOLLAR PENTAGRAM',
'On Heiji Hattori and Conan"s visiting to the site for a Kendo tournament to be held in Hakodate, they encounter Kid, who is aiming for a Japanese sword said to be hidden in the repository of the Onoe Zaibatsu. At the same time, a Japanese-American man known as the “Merchant of Death” was looking for treasures believed to have been hidden somewhere in Hakodate, when his body with a cross cut on the chest was found in Hakodate warehouse district. That treasure and the sword Kid is aiming at seem to have something kind of connection.',
'https://www.youtube.com/embed/C4pG3GbhQZw?rel=0&showinfo=0','Rikiya Koyama, Minami Takayama, Kenjirô Tsuda, Wakana Yamazaki','Animation, Mystery, Romance','8/2/2024','111 minutes','Chika Nagaoka'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/f/m/fmm_intl_online_6072x9000_faces-stage_tsr_06.jpg','FLY ME TO THE MOON',
'Starring Scarlett Johansson and Channing Tatum, FLY ME TO THE MOON is a sharp, stylish comedy-drama set against the high-stakes backdrop of NASA’s historic moon landing. Brought in to fix NASA’s public image, sparks fly in all directions as marketing wunderkind Kelly Jones (Johansson) wreaks havoc on launch director Cole Davis’s (Tatum) already difficult task. When the President deems the mission too important to fail, Jones is directed to stage a fake moon landing as back-up and the countdown truly begins…',
'https://www.youtube.com/embed/2iiZa-MzsE8?rel=0&showinfo=0','Scarlett Johansson, Channing Tatum, Nick Dillenburg, Anna Garcia, Jim Rash, Noah Robbins, Colin Woodell, Christian Zuber, Donald Elise Watkins, with Ray Romano, and Woody Harrelson','Comedy, Drama','8/9/2024','131 minutews','Greg Berlanti'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/4/0/406x600-pilot.jpg','PILOT',
'Jung Woo goes from being a successful, popular pilot to being unemployed one morning. However, he succeeds in getting a new job after accidentally taking on a newly laundered identity.',
'https://www.youtube.com/embed/4n60mgbiiz0?rel=0&showinfo=0','CHO Jung-seok, LEE Ju-myung, HAN Sun-hwa, SHIN Seung-ho','Comedy','8/2/2024','N/A','Kim Han-Gyul'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/h/p/hpc_intl_online_1080x1350_tsr_01.jpg','HAROLD AND THE PURPLE CRAYON',
'A young boy named Harold embarks on a magical mission with the help of his purple crayon','https://www.youtube.com/embed/4czuJSq9EFA?rel=0&showinfo=0',
'Zooey Deschanel, Zachary Levi, Camille Guaty','Adventure, Comedy','8/2/2024','92 minutes','Carlos Saldanha'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/r/s/rsz_romulus_instagram_payoff_poster_vietnam.jpg','Alien: Romulus',
'While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.',
'https://www.youtube.com/embed/04b7WWv7JTM?rel=0&showinfo=0','Cailee Spaeny, Isabela Merced, Archie Renaux','Horror, Science Fiction','8/16/2024','N/A','Fede Alvarez'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/4/0/406x600-mada.jpg','MA DA',
'This is a story about Mrs Lệ, a corpse collector in Mekong Delta. During her job, she has to fight Ma Da, a false soul who lives under the dark water. For striking back, Ma Da kidnapped Nhung, Mrs Lệ’s 9 years old daughter. Lệ has to find help from others to rescue Nhung and find out the secrets about the ghost named Ma Da.',
'No trailer','Việt Hương, Dạ Chúc, Trung Dân, Diệu Đức, Thành Lộc, Cẩm Ly, Minh Khang…','Horror','8/16/2024','N/A','Nguyễn Hữu Hoàng'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/b/e/beetlejuice_beetlejuice-914461307-large.jpg','BEETLEJUICE BEETLEJUICE',
'After an unexpected family tragedy, three generations of the Deetz family return home to Winter River. Still haunted by Beetlejuice, Lydia"s life is turned upside down when her rebellious teenage daughter, Astrid, discovers the mysterious model of the town in the attic and the portal to the Afterlife is accidentally opened. With trouble brewing in both realms, it"s only a matter of time until someone says Beetlejuice"s name three times and the mischievous demon returns to unleash his very own brand of mayhem.',
'https://www.youtube.com/embed/Ka3jkR0L98Q?rel=0&showinfo=0','Jenna Ortega, Michael Keaton, Winona Ryder, Monica Bellucci, Jenna Ortega, Willem Dafoe, Justin Theroux','Comedy, Horror','9/6/2024','144 minutes','Tim Burton'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/s/n/sne_poster_470x700.jpg','SPEAK NO EVIL',
'When an American family is invited to spend the weekend at the idyllic country estate of a charming British family they befriended on vacation, what begins as a dream holiday soon warps into a snarled psychological nightmare.',
'https://www.youtube.com/embed/VypozL0dbj4?rel=0&showinfo=0','James McAvoy, Mackenzie Davis, Scoot McNairy,...','Drama, Horror, Thriller','9/13/2024','110 minutes','James Watkins'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/t/f/tf1_poster_470x700.jpg','TRANSFORMERS ONE',
'The untold origin story of Optimus Prime and Megatron, better known as sworn enemies, but once were friends bonded like brothers who changed the fate of Cybertron forever.',
'https://www.youtube.com/embed/WLqCKr2h1BI?rel=0&showinfo=0','Chris Hemsworth; Brian Tyree Henry; Scarlett Johansson','Action, Adventure, Animation','9/20/2024','N/A','Josh Cooley'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_joker_folie_a_deux_1.jpg','JOKER: FOLIE À DEUX',
'Sequel to the film “JOKER” from 2019','https://www.youtube.com/embed/gxWLZoMT2MU?rel=0&showinfo=0','Sequel to the film “JOKER” from 2019','Crime, Drama, Musicals, Thriller','10/4/2024','N/A','Todd Phillips'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/w/r/wrb_poster_470x700.jpg','THE WILD ROBOT',
'After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the island"s animals and cares for an orphaned baby goose.',
'https://www.youtube.com/embed/2l8_FNIBWLM?rel=0&showinfo=0','Lupita Nyong"o, Pedro Pascal, Catherine O’hara, Bill Nighy,...','Adventure, Animation, Family, Science Fiction','10/11/2024','N/A','Chris Sanders'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/s/m/sm2_intl_dgtl_online_tsr_1sht_torn_ov_400x633.jpg','SMILE 2',
'About to embark on a new world tour, global pop sensation Skye Riley (Naomi Scott) begins experiencing increasingly terrifying and inexplicable events. Overwhelmed by the escalating horrors and the pressures of fame, Skye is forced to face her dark past to regain control of her life before it spirals out of control.',
'https://www.youtube.com/embed/YMD-wGpbB3M?rel=0&showinfo=0','Rosemarie DeWitt, Kyle Gallner, Naomi Scott, Dylan Gelula, Raul Castillo, Daphne Zelle, Lukas Gage.','Horror, Mystery, Thriller','10/18/2024','N/A','Parker Finn'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/r/s/rsz_vnm3_intl_online_1080x1350_tsr_01.jpg','VENOM: THE LAST DANCE',
'"Tom Hardy sẽ tái xuất trong bom tấn Venom: The Last Dance (Tựa Việt: Venom: Kèo Cuối) và phải đối mặt với kẻ thù lớn nhất từ trước đến nay - toàn bộ chủng tộc Symbiote. Venom: Kèo cuối - Dự kiến khởi chiếu 25.10.2024"',
'https://www.youtube.com/embed/id1rfr_KZWg?rel=0&showinfo=0','Tom Hardy, Juno Temple, Chiwetel Ejiofor, Clark Backo, Stephen Graham','Action, Adventure, Fantasy, Science Fiction','10/25/2024','N/A','Kelly Marcel'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/w/i/wicked_cgv.jpg','WICKED',
'After two decades as one of the most beloved and enduring musicals on the stage, Wicked makes its long-awaited journey to the big screen as a spectacular, generation-defining cinematic event this holiday season',
'https://www.youtube.com/embed/IILf3ZEBnmM?rel=0&showinfo=0','Cynthia Erivo, Ariana Grande, Jonathan Bailey','Fantasy, Musicals, Romance','11/29/2024','N/A','Jon M. Chu'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/h/_/h_nh_tr_nh_c_a_moana_2.jpg','MOANA 2',
'After receiving an unexpected call from her wayfinding ancestors, Moana journeys to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she has ever faced.',
'https://www.youtube.com/embed/yrohKVnDX7Q?rel=0&showinfo=0','Auli"i Cravalho, Dwayne Johnson, Alan Tudyk','Adventure, Animation','11/29/2024','N/A','David G. Derrick Jr.'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/m/u/mufasa.jpg','MUFASA: THE LION KING',
'Simba, having become king of the Pride Lands, is determined for his cub to follow in his paw prints while the origins of his late father Mufasa are explored.',
'https://www.youtube.com/embed/pQ7Zk081yMY?rel=0&showinfo=0','N/A','Adventure, Family','12/20/2024','N/A','Barry Jenkins'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/n/x/nxcmct_-_1st_look_poster_-_kc_10.2024_1_.jpg','ONCE UPON A LOVE STORY',
'Once Upon A Love Story revolves around the friendship and love between two boys and a girl from childhood to adulthood, facing the challenges of fate. Spanning four stages from 1987 to 2000, three friends of the same age - Vinh, Mien, and Phuc - have loved, stumbled through life together and overcame obstacles hand in hand.',
'https://www.youtube.com/embed/clisHvIYcKo?rel=0&showinfo=0','Avin Lu, Ngọc Xuân, Đỗ Nhật Hoàng, Thanh Tú, Bảo Tiên, Hạo Khang','Romance','1/1/2025','N/A','Trịnh Đình Lê Minh'),
	('https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_1st_nhagiatien_70x100_1_.jpg','NHÀ GIA TIÊN',
'First-look poster của Nhà Gia Tiên gây ấn tượng bởi hình ảnh mang màu sắc rực rỡ, nổi bật từ các họa tiết truyền thống, tái hiện bức Cửu Huyền Thất Tổ làm bằng Tranh Kiếng - dòng tranh nổi tiếng tại vùng đất Nam Bộ. Bức Cửu Huyền Thất Tổ thường xuất hiện trong không gian thờ cúng như bàn thờ gia tiên hay nhà thờ tổ để tỏ lòng kính trọng và nhớ ơn ông bà, tổ tiên. First-look poster dựa trên bức Cửu Huyền Thất Tổ đã truyền tải đúng tinh thần cốt lõi của dự án. Nhà Gia Tiên sẽ thuộc thể loại hài, linh dị, tập trung khai thác tình cảm gia đình để người xem cảm nhận những giá trị cốt lõi bên trong một căn nhà đặc biệt được truyền qua nhiều thế hệ ông cha.',
'No trailer','Huỳnh Lập','Comedy','1/1/2025','N/A','Huỳnh Lập')
	

	select*from cinemas

insert into run_time(run_time_id, time_start, time_end) values
(1,'8:00:00','09:45:00'),
(2,'10:00:00','11:45:00'),
(3,'12:00:00','13:45:00'),
(4,'14:00:00','15:45:00'),
(5,'16:00:00','17:45:00'),
(6,'18:00:00','19:45:00')

insert into room(cinema_id,room_id,room_name) values
(1,11,'room1'),(1,12,'room2'),(1,13,'room3'),
(2,21,'room1'),(2,22,'room2'),(2,23,'room3'),
(3,31,'room1'),(3,32,'room2'),(3,33,'room3'),
(4,41,'room1'),(4,42,'room2'),(4,43,'room3'),
(5,51,'room1'),(5,52,'room2'),(5,53,'room3'),
(6,61,'room1'),(6,62,'room2'),(6,63,'room3'),
(7,71,'room1'),(7,72,'room2'),(7,73,'room3'),
(8,81,'room1'),(8,82,'room2'),(8,83,'room3'),
(9,91,'room1'),(9,92,'room2'),(9,93,'room3')

INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(11, 1101, 'A01', 1), (11, 1102, 'A02', 1), (11, 1103, 'A03', 1), (11, 1104, 'A04', 1), (11, 1105, 'A05', 1),
(11, 1106, 'B01', 1), (11, 1107, 'B02', 1), (11, 1108, 'B03', 1), (11, 1109, 'B04', 1), (11, 1110, 'B05', 1),
(11, 1111, 'C01', 1), (11, 1112, 'C02', 1), (11, 1113, 'C03', 1), (11, 1114, 'C04', 1), (11, 1115, 'C05', 1),
(11, 1116, 'D01', 1), (11, 1117, 'D02', 1), (11, 1118, 'D03', 1), (11, 1119, 'D04', 1), (11, 1120, 'D05', 1),
(12, 1201, 'A01', 1), (12, 1202, 'A02', 1), (12, 1203, 'A03', 1), (12, 1204, 'A04', 1), (12, 1205, 'A05', 1),
(12, 1206, 'B01', 1), (12, 1207, 'B02', 1), (12, 1208, 'B03', 1), (12, 1209, 'B04', 1), (12, 1210, 'B05', 1),
(12, 1211, 'C01', 1), (12, 1212, 'C02', 1), (12, 1213, 'C03', 1), (12, 1214, 'C04', 1), (12, 1215, 'C05', 1),
(12, 1216, 'D01', 1), (12, 1217, 'D02', 1), (12, 1218, 'D03', 1), (12, 1219, 'D04', 1), (12, 1220, 'D05', 1),
(13, 1301, 'A01', 1), (13, 1302, 'A02', 1), (13, 1303, 'A03', 1), (13, 1304, 'A04', 1), (13, 1305, 'A05', 1),
(13, 1306, 'B01', 1), (13, 1307, 'B02', 1), (13, 1308, 'B03', 1), (13, 1309, 'B04', 1), (13, 1310, 'B05', 1),
(13, 1311, 'C01', 1), (13, 1312, 'C02', 1), (13, 1313, 'C03', 1), (13, 1314, 'C04', 1), (13, 1315, 'C05', 1),
(13, 1316, 'D01', 1), (13, 1317, 'D02', 1), (13, 1318, 'D03', 1), (13, 1319, 'D04', 1), (13, 1320, 'D05', 1),
(21, 2101, 'A01', 1), (21, 2102, 'A02', 1), (21, 2103, 'A03', 1), (21, 2104, 'A04', 1), (21, 2105, 'A05', 1),
(21, 2106, 'B01', 1), (21, 2107, 'B02', 1), (21, 2108, 'B03', 1), (21, 2109, 'B04', 1), (21, 2110, 'B05', 1),
(21, 2111, 'C01', 1), (21, 2112, 'C02', 1), (21, 2113, 'C03', 1), (21, 2114, 'C04', 1), (21, 2115, 'C05', 1),
(21, 2116, 'D01', 1), (21, 2117, 'D02', 1), (21, 2118, 'D03', 1), (21, 2119, 'D04', 1), (21, 2120, 'D05', 1),
(22, 2201, 'A01', 1), (22, 2202, 'A02', 1), (22, 2203, 'A03', 1), (22, 2204, 'A04', 1), (22, 2205, 'A05', 1);

INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(22, 2206, 'B01', 1), (22, 2207, 'B02', 1), (22, 2208, 'B03', 1), (22, 2209, 'B04', 1), (22, 2210, 'B05', 1),
(22, 2211, 'C01', 1), (22, 2212, 'C02', 1), (22, 2213, 'C03', 1), (22, 2214, 'C04', 1), (22, 2215, 'C05', 1),
(22, 2216, 'D01', 1), (22, 2217, 'D02', 1), (22, 2218, 'D03', 1), (22, 2219, 'D04', 1), (22, 2220, 'D05', 1),
(23, 2301, 'A01', 1), (23, 2302, 'A02', 1), (23, 2303, 'A03', 1), (23, 2304, 'A04', 1), (23, 2305, 'A05', 1),
(23, 2306, 'B01', 1), (23, 2307, 'B02', 1), (23, 2308, 'B03', 1), (23, 2309, 'B04', 1), (23, 2310, 'B05', 1),
(23, 2311, 'C01', 1), (23, 2312, 'C02', 1), (23, 2313, 'C03', 1), (23, 2314, 'C04', 1), (23, 2315, 'C05', 1),
(23, 2316, 'D01', 1), (23, 2317, 'D02', 1), (23, 2318, 'D03', 1), (23, 2319, 'D04', 1), (23, 2320, 'D05', 1),
(31, 3101, 'A01', 1), (31, 3102, 'A02', 1), (31, 3103, 'A03', 1), (31, 3104, 'A04', 1), (31, 3105, 'A05', 1),
(31, 3106, 'B01', 1), (31, 3107, 'B02', 1), (31, 3108, 'B03', 1), (31, 3109, 'B04', 1), (31, 3110, 'B05', 1),
(31, 3111, 'C01', 1), (31, 3112, 'C02', 1), (31, 3113, 'C03', 1), (31, 3114, 'C04', 1), (31, 3115, 'C05', 1),
(31, 3116, 'D01', 1), (31, 3117, 'D02', 1), (31, 3118, 'D03', 1), (31, 3119, 'D04', 1), (31, 3120, 'D05', 1),
(32, 3201, 'A01', 1), (32, 3202, 'A02', 1), (32, 3203, 'A03', 1), (32, 3204, 'A04', 1), (32, 3205, 'A05', 1),
(32, 3206, 'B01', 1), (32, 3207, 'B02', 1), (32, 3208, 'B03', 1), (32, 3209, 'B04', 1), (32, 3210, 'B05', 1),
(32, 3211, 'C01', 1), (32, 3212, 'C02', 1), (32, 3213, 'C03', 1), (32, 3214, 'C04', 1), (32, 3215, 'C05', 1),
(32, 3216, 'D01', 1), (32, 3217, 'D02', 1), (32, 3218, 'D03', 1), (32, 3219, 'D04', 1), (32, 3220, 'D05', 1),
(33, 3301, 'A01', 1), (33, 3302, 'A02', 1), (33, 3303, 'A03', 1), (33, 3304, 'A04', 1), (33, 3305, 'A05', 1),
(33, 3306, 'B01', 1), (33, 3307, 'B02', 1), (33, 3308, 'B03', 1), (33, 3309, 'B04', 1), (33, 3310, 'B05', 1),
(33, 3311, 'C01', 1), (33, 3312, 'C02', 1), (33, 3313, 'C03', 1), (33, 3314, 'C04', 1), (33, 3315, 'C05', 1),
(33, 3316, 'D01', 1), (33, 3317, 'D02', 1), (33, 3318, 'D03', 1), (33, 3319, 'D04', 1), (33, 3320, 'D05', 1),
(41, 4101, 'A01', 1), (41, 4102, 'A02', 1), (41, 4103, 'A03', 1), (41, 4104, 'A04', 1), (41, 4105, 'A05', 1),
(41, 4106, 'B01', 1), (41, 4107, 'B02', 1), (41, 4108, 'B03', 1), (41, 4109, 'B04', 1), (41, 4110, 'B05', 1),
(41, 4111, 'C01', 1), (41, 4112, 'C02', 1), (41, 4113, 'C03', 1), (41, 4114, 'C04', 1), (41, 4115, 'C05', 1),
(41, 4116, 'D01', 1), (41, 4117, 'D02', 1), (41, 4118, 'D03', 1), (41, 4119, 'D04', 1), (41, 4120, 'D05', 1),
(42, 4201, 'A01', 1), (42, 4202, 'A02', 1), (42, 4203, 'A03', 1), (42, 4204, 'A04', 1), (42, 4205, 'A05', 1),
(42, 4206, 'B01', 1), (42, 4207, 'B02', 1), (42, 4208, 'B03', 1), (42, 4209, 'B04', 1), (42, 4210, 'B05', 1),
(42, 4211, 'C01', 1), (42, 4212, 'C02', 1), (42, 4213, 'C03', 1), (42, 4214, 'C04', 1), (42, 4215, 'C05', 1),
(42, 4216, 'D01', 1), (42, 4217, 'D02', 1), (42, 4218, 'D03', 1), (42, 4219, 'D04', 1), (42, 4220, 'D05', 1),
(43, 4301, 'A01', 1), (43, 4302, 'A02', 1), (43, 4303, 'A03', 1), (43, 4304, 'A04', 1), (43, 4305, 'A05', 1),
(43, 4306, 'B01', 1), (43, 4307, 'B02', 1), (43, 4308, 'B03', 1), (43, 4309, 'B04', 1), (43, 4310, 'B05', 1),
(43, 4311, 'C01', 1), (43, 4312, 'C02', 1), (43, 4313, 'C03', 1), (43, 4314, 'C04', 1), (43, 4315, 'C05', 1),
(43, 4316, 'D01', 1), (43, 4317, 'D02', 1), (43, 4318, 'D03', 1), (43, 4319, 'D04', 1), (43, 4320, 'D05', 1);

INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
-- Room 51
(51, 5101, 'A01', 1), (51, 5102, 'A02', 1), (51, 5103, 'A03', 1), (51, 5104, 'A04', 1), (51, 5105, 'A05', 1),
(51, 5106, 'B01', 1), (51, 5107, 'B02', 1), (51, 5108, 'B03', 1), (51, 5109, 'B04', 1), (51, 5110, 'B05', 1),
(51, 5111, 'C01', 1), (51, 5112, 'C02', 1), (51, 5113, 'C03', 1), (51, 5114, 'C04', 1), (51, 5115, 'C05', 1),
(51, 5116, 'D01', 1), (51, 5117, 'D02', 1), (51, 5118, 'D03', 1), (51, 5119, 'D04', 1), (51, 5120, 'D05', 1),

-- Room 52
(52, 5201, 'A01', 1), (52, 5202, 'A02', 1), (52, 5203, 'A03', 1), (52, 5204, 'A04', 1), (52, 5205, 'A05', 1),
(52, 5206, 'B01', 1), (52, 5207, 'B02', 1), (52, 5208, 'B03', 1), (52, 5209, 'B04', 1), (52, 5210, 'B05', 1),
(52, 5211, 'C01', 1), (52, 5212, 'C02', 1), (52, 5213, 'C03', 1), (52, 5214, 'C04', 1), (52, 5215, 'C05', 1),
(52, 5216, 'D01', 1), (52, 5217, 'D02', 1), (52, 5218, 'D03', 1), (52, 5219, 'D04', 1), (52, 5220, 'D05', 1),

-- Room 53
(53, 5301, 'A01', 1), (53, 5302, 'A02', 1), (53, 5303, 'A03', 1), (53, 5304, 'A04', 1), (53, 5305, 'A05', 1),
(53, 5306, 'B01', 1), (53, 5307, 'B02', 1), (53, 5308, 'B03', 1), (53, 5309, 'B04', 1), (53, 5310, 'B05', 1),
(53, 5311, 'C01', 1), (53, 5312, 'C02', 1), (53, 5313, 'C03', 1), (53, 5314, 'C04', 1), (53, 5315, 'C05', 1),
(53, 5316, 'D01', 1), (53, 5317, 'D02', 1), (53, 5318, 'D03', 1), (53, 5319, 'D04', 1), (53, 5320, 'D05', 1),

-- Room 61
(61, 6101, 'A01', 1), (61, 6102, 'A02', 1), (61, 6103, 'A03', 1), (61, 6104, 'A04', 1), (61, 6105, 'A05', 1),
(61, 6106, 'B01', 1), (61, 6107, 'B02', 1), (61, 6108, 'B03', 1), (61, 6109, 'B04', 1), (61, 6110, 'B05', 1),
(61, 6111, 'C01', 1), (61, 6112, 'C02', 1), (61, 6113, 'C03', 1), (61, 6114, 'C04', 1), (61, 6115, 'C05', 1),
(61, 6116, 'D01', 1), (61, 6117, 'D02', 1), (61, 6118, 'D03', 1), (61, 6119, 'D04', 1), (61, 6120, 'D05', 1),

-- Room 62
(62, 6201, 'A01', 1), (62, 6202, 'A02', 1), (62, 6203, 'A03', 1), (62, 6204, 'A04', 1), (62, 6205, 'A05', 1),
(62, 6206, 'B01', 1), (62, 6207, 'B02', 1), (62, 6208, 'B03', 1), (62, 6209, 'B04', 1), (62, 6210, 'B05', 1),
(62, 6211, 'C01', 1), (62, 6212, 'C02', 1), (62, 6213, 'C03', 1), (62, 6214, 'C04', 1), (62, 6215, 'C05', 1),
(62, 6216, 'D01', 1), (62, 6217, 'D02', 1), (62, 6218, 'D03', 1), (62, 6219, 'D04', 1), (62, 6220, 'D05', 1),

-- Room 63
(63, 6301, 'A01', 1), (63, 6302, 'A02', 1), (63, 6303, 'A03', 1), (63, 6304, 'A04', 1), (63, 6305, 'A05', 1),
(63, 6306, 'B01', 1), (63, 6307, 'B02', 1), (63, 6308, 'B03', 1), (63, 6309, 'B04', 1), (63, 6310, 'B05', 1),
(63, 6311, 'C01', 1), (63, 6312, 'C02', 1), (63, 6313, 'C03', 1), (63, 6314, 'C04', 1), (63, 6315, 'C05', 1),
(63, 6316, 'D01', 1), (63, 6317, 'D02', 1), (63, 6318, 'D03', 1), (63, 6319, 'D04', 1), (63, 6320, 'D05', 1),

-- Room 71
(71, 7101, 'A01', 1), (71, 7102, 'A02', 1), (71, 7103, 'A03', 1), (71, 7104, 'A04', 1), (71, 7105, 'A05', 1),
(71, 7106, 'B01', 1), (71, 7107, 'B02', 1), (71, 7108, 'B03', 1), (71, 7109, 'B04', 1), (71, 7110, 'B05', 1),
(71, 7111, 'C01', 1), (71, 7112, 'C02', 1), (71, 7113, 'C03', 1), (71, 7114, 'C04', 1), (71, 7115, 'C05', 1),
(71, 7116, 'D01', 1), (71, 7117, 'D02', 1), (71, 7118, 'D03', 1), (71, 7119, 'D04', 1), (71, 7120, 'D05', 1),

-- Room 72
(72, 7201, 'A01', 1), (72, 7202, 'A02', 1), (72, 7203, 'A03', 1), (72, 7204, 'A04', 1), (72, 7205, 'A05', 1),
(72, 7206, 'B01', 1), (72, 7207, 'B02', 1), (72, 7208, 'B03', 1), (72, 7209, 'B04', 1), (72, 7210, 'B05', 1),
(72, 7211, 'C01', 1), (72, 7212, 'C02', 1), (72, 7213, 'C03', 1), (72, 7214, 'C04', 1), (72, 7215, 'C05', 1),
(72, 7216, 'D01', 1), (72, 7217, 'D02', 1), (72, 7218, 'D03', 1), (72, 7219, 'D04', 1), (72, 7220, 'D05', 1),

-- Room 73
(73, 7301, 'A01', 1), (73, 7302, 'A02', 1), (73, 7303, 'A03', 1), (73, 7304, 'A04', 1), (73, 7305, 'A05', 1),
(73, 7306, 'B01', 1), (73, 7307, 'B02', 1), (73, 7308, 'B03', 1), (73, 7309, 'B04', 1), (73, 7310, 'B05', 1),
(73, 7311, 'C01', 1), (73, 7312, 'C02', 1), (73, 7313, 'C03', 1), (73, 7314, 'C04', 1), (73, 7315, 'C05', 1),
(73, 7316, 'D01', 1), (73, 7317, 'D02', 1), (73, 7318, 'D03', 1), (73, 7319, 'D04', 1), (73, 7320, 'D05', 1);

INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
-- Room 81
(81, 8101, 'A01', 1), (81, 8102, 'A02', 1), (81, 8103, 'A03', 1), (81, 8104, 'A04', 1), (81, 8105, 'A05', 1),
(81, 8106, 'B01', 1), (81, 8107, 'B02', 1), (81, 8108, 'B03', 1), (81, 8109, 'B04', 1), (81, 8110, 'B05', 1),
(81, 8111, 'C01', 1), (81, 8112, 'C02', 1), (81, 8113, 'C03', 1), (81, 8114, 'C04', 1), (81, 8115, 'C05', 1),
(81, 8116, 'D01', 1), (81, 8117, 'D02', 1), (81, 8118, 'D03', 1), (81, 8119, 'D04', 1), (81, 8120, 'D05', 1),

-- Room 82
(82, 8201, 'A01', 1), (82, 8202, 'A02', 1), (82, 8203, 'A03', 1), (82, 8204, 'A04', 1), (82, 8205, 'A05', 1),
(82, 8206, 'B01', 1), (82, 8207, 'B02', 1), (82, 8208, 'B03', 1), (82, 8209, 'B04', 1), (82, 8210, 'B05', 1),
(82, 8211, 'C01', 1), (82, 8212, 'C02', 1), (82, 8213, 'C03', 1), (82, 8214, 'C04', 1), (82, 8215, 'C05', 1),
(82, 8216, 'D01', 1), (82, 8217, 'D02', 1), (82, 8218, 'D03', 1), (82, 8219, 'D04', 1), (82, 8220, 'D05', 1),

-- Room 83
(83, 8301, 'A01', 1), (83, 8302, 'A02', 1), (83, 8303, 'A03', 1), (83, 8304, 'A04', 1), (83, 8305, 'A05', 1),
(83, 8306, 'B01', 1), (83, 8307, 'B02', 1), (83, 8308, 'B03', 1), (83, 8309, 'B04', 1), (83, 8310, 'B05', 1),
(83, 8311, 'C01', 1), (83, 8312, 'C02', 1), (83, 8313, 'C03', 1), (83, 8314, 'C04', 1), (83, 8315, 'C05', 1),
(83, 8316, 'D01', 1), (83, 8317, 'D02', 1), (83, 8318, 'D03', 1), (83, 8319, 'D04', 1), (83, 8320, 'D05', 1),

-- Room 91
(91, 9101, 'A01', 1), (91, 9102, 'A02', 1), (91, 9103, 'A03', 1), (91, 9104, 'A04', 1), (91, 9105, 'A05', 1),
(91, 9106, 'B01', 1), (91, 9107, 'B02', 1), (91, 9108, 'B03', 1), (91, 9109, 'B04', 1), (91, 9110, 'B05', 1),
(91, 9111, 'C01', 1), (91, 9112, 'C02', 1), (91, 9113, 'C03', 1), (91, 9114, 'C04', 1), (91, 9115, 'C05', 1),
(91, 9116, 'D01', 1), (91, 9117, 'D02', 1), (91, 9118, 'D03', 1), (91, 9119, 'D04', 1), (91, 9120, 'D05', 1),

-- Room 92
(92, 9201, 'A01', 1), (92, 9202, 'A02', 1), (92, 9203, 'A03', 1), (92, 9204, 'A04', 1), (92, 9205, 'A05', 1),
(92, 9206, 'B01', 1), (92, 9207, 'B02', 1), (92, 9208, 'B03', 1), (92, 9209, 'B04', 1), (92, 9210, 'B05', 1),
(92, 9211, 'C01', 1), (92, 9212, 'C02', 1), (92, 9213, 'C03', 1), (92, 9214, 'C04', 1), (92, 9215, 'C05', 1),
(92, 9216, 'D01', 1), (92, 9217, 'D02', 1), (92, 9218, 'D03', 1), (92, 9219, 'D04', 1), (92, 9220, 'D05', 1),

-- Room 93
(93, 9301, 'A01', 1), (93, 9302, 'A02', 1), (93, 9303, 'A03', 1), (93, 9304, 'A04', 1), (93, 9305, 'A05', 1),
(93, 9306, 'B01', 1), (93, 9307, 'B02', 1), (93, 9308, 'B03', 1), (93, 9309, 'B04', 1), (93, 9310, 'B05', 1),
(93, 9311, 'C01', 1), (93, 9312, 'C02', 1), (93, 9313, 'C03', 1), (93, 9314, 'C04', 1), (93, 9315, 'C05', 1),
(93, 9316, 'D01', 1), (93, 9317, 'D02', 1), (93, 9318, 'D03', 1), (93, 9319, 'D04', 1), (93, 9320, 'D05', 1);

INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
-- Room 11
(11, 1101, 'A01', 2), (11, 1102, 'A02', 2), (11, 1103, 'A03', 2), (11, 1104, 'A04', 2), (11, 1105, 'A05', 2),
(11, 1106, 'B01', 2), (11, 1107, 'B02', 2), (11, 1108, 'B03', 2), (11, 1109, 'B04', 2), (11, 1110, 'B05', 2),
(11, 1111, 'C01', 2), (11, 1112, 'C02', 2), (11, 1113, 'C03', 2), (11, 1114, 'C04', 2), (11, 1115, 'C05', 2),
(11, 1116, 'D01', 2), (11, 1117, 'D02', 2), (11, 1118, 'D03', 2), (11, 1119, 'D04', 2), (11, 1120, 'D05', 2),

-- Room 12
(12, 1201, 'A01', 2), (12, 1202, 'A02', 2), (12, 1203, 'A03', 2), (12, 1204, 'A04', 2), (12, 1205, 'A05', 2),
(12, 1206, 'B01', 2), (12, 1207, 'B02', 2), (12, 1208, 'B03', 2), (12, 1209, 'B04', 2), (12, 1210, 'B05', 2),
(12, 1211, 'C01', 2), (12, 1212, 'C02', 2), (12, 1213, 'C03', 2), (12, 1214, 'C04', 2), (12, 1215, 'C05', 2),
(12, 1216, 'D01', 2), (12, 1217, 'D02', 2), (12, 1218, 'D03', 2), (12, 1219, 'D04', 2), (12, 1220, 'D05', 2),

-- Room 13
(13, 1301, 'A01', 2), (13, 1302, 'A02', 2), (13, 1303, 'A03', 2), (13, 1304, 'A04', 2), (13, 1305, 'A05', 2),
(13, 1306, 'B01', 2), (13, 1307, 'B02', 2), (13, 1308, 'B03', 2), (13, 1309, 'B04', 2), (13, 1310, 'B05', 2),
(13, 1311, 'C01', 2), (13, 1312, 'C02', 2), (13, 1313, 'C03', 2), (13, 1314, 'C04', 2), (13, 1315, 'C05', 2),
(13, 1316, 'D01', 2), (13, 1317, 'D02', 2), (13, 1318, 'D03', 2), (13, 1319, 'D04', 2), (13, 1320, 'D05', 2),

-- Room 21
(21, 2101, 'A01', 2), (21, 2102, 'A02', 2), (21, 2103, 'A03', 2), (21, 2104, 'A04', 2), (21, 2105, 'A05', 2),
(21, 2106, 'B01', 2), (21, 2107, 'B02', 2), (21, 2108, 'B03', 2), (21, 2109, 'B04', 2), (21, 2110, 'B05', 2),
(21, 2111, 'C01', 2), (21, 2112, 'C02', 2), (21, 2113, 'C03', 2), (21, 2114, 'C04', 2), (21, 2115, 'C05', 2),
(21, 2116, 'D01', 2), (21, 2117, 'D02', 2), (21, 2118, 'D03', 2), (21, 2119, 'D04', 2), (21, 2120, 'D05', 2),

-- Room 22
(22, 2201, 'A01', 2), (22, 2202, 'A02', 2), (22, 2203, 'A03', 2), (22, 2204, 'A04', 2), (22, 2205, 'A05', 2),
(22, 2206, 'B01', 2), (22, 2207, 'B02', 2), (22, 2208, 'B03', 2), (22, 2209, 'B04', 2), (22, 2210, 'B05', 2),
(22, 2211, 'C01', 2), (22, 2212, 'C02', 2), (22, 2213, 'C03', 2), (22, 2214, 'C04', 2), (22, 2215, 'C05', 2),
(22, 2216, 'D01', 2), (22, 2217, 'D02', 2), (22, 2218, 'D03', 2), (22, 2219, 'D04', 2), (22, 2220, 'D05', 2),

-- Room 23
(23, 2301, 'A01', 2), (23, 2302, 'A02', 2), (23, 2303, 'A03', 2), (23, 2304, 'A04', 2), (23, 2305, 'A05', 2),
(23, 2306, 'B01', 2), (23, 2307, 'B02', 2), (23, 2308, 'B03', 2), (23, 2309, 'B04', 2), (23, 2310, 'B05', 2),
(23, 2311, 'C01', 2), (23, 2312, 'C02', 2), (23, 2313, 'C03', 2), (23, 2314, 'C04', 2), (23, 2315, 'C05', 2),
(23, 2316, 'D01', 2), (23, 2317, 'D02', 2), (23, 2318, 'D03', 2), (23, 2319, 'D04', 2), (23, 2320, 'D05', 2),

-- Room 31
(31, 3101, 'A01', 2), (31, 3102, 'A02', 2), (31, 3103, 'A03', 2), (31, 3104, 'A04', 2), (31, 3105, 'A05', 2),
(31, 3106, 'B01', 2), (31, 3107, 'B02', 2), (31, 3108, 'B03', 2), (31, 3109, 'B04', 2), (31, 3110, 'B05', 2),
(31, 3111, 'C01', 2), (31, 3112, 'C02', 2), (31, 3113, 'C03', 2), (31, 3114, 'C04', 2), (31, 3115, 'C05', 2),
(31, 3116, 'D01', 2), (31, 3117, 'D02', 2), (31, 3118, 'D03', 2), (31, 3119, 'D04', 2), (31, 3120, 'D05', 2),

-- Room 32
(32, 3201, 'A01', 2), (32, 3202, 'A02', 2), (32, 3203, 'A03', 2), (32, 3204, 'A04', 2), (32, 3205, 'A05', 2),
(32, 3206, 'B01', 2), (32, 3207, 'B02', 2), (32, 3208, 'B03', 2), (32, 3209, 'B04', 2), (32, 3210, 'B05', 2),
(32, 3211, 'C01', 2), (32, 3212, 'C02', 2), (32, 3213, 'C03', 2), (32, 3214, 'C04', 2), (32, 3215, 'C05', 2),
(32, 3216, 'D01', 2), (32, 3217, 'D02', 2), (32, 3218, 'D03', 2), (32, 3219, 'D04', 2), (32, 3220, 'D05', 2),

-- Room 33
(33, 3301, 'A01', 2), (33, 3302, 'A02', 2), (33, 3303, 'A03', 2), (33, 3304, 'A04', 2), (33, 3305, 'A05', 2),
(33, 3306, 'B01', 2), (33, 3307, 'B02', 2), (33, 3308, 'B03', 2), (33, 3309, 'B04', 2), (33, 3310, 'B05', 2),
(33, 3311, 'C01', 2), (33, 3312, 'C02', 2), (33, 3313, 'C03', 2), (33, 3314, 'C04', 2), (33, 3315, 'C05', 2),
(33, 3316, 'D01', 2), (33, 3317, 'D02', 2), (33, 3318, 'D03', 2), (33, 3319, 'D04', 2), (33, 3320, 'D05', 2),

-- Room 41
(41, 4101, 'A01', 2), (41, 4102, 'A02', 2), (41, 4103, 'A03', 2), (41, 4104, 'A04', 2), (41, 4105, 'A05', 2),
(41, 4106, 'B01', 2), (41, 4107, 'B02', 2), (41, 4108, 'B03', 2), (41, 4109, 'B04', 2), (41, 4110, 'B05', 2),
(41, 4111, 'C01', 2), (41, 4112, 'C02', 2), (41, 4113, 'C03', 2), (41, 4114, 'C04', 2), (41, 4115, 'C05', 2),
(41, 4116, 'D01', 2), (41, 4117, 'D02', 2), (41, 4118, 'D03', 2), (41, 4119, 'D04', 2), (41, 4120, 'D05', 2),

-- Room 42
(42, 4201, 'A01', 2), (42, 4202, 'A02', 2), (42, 4203, 'A03', 2), (42, 4204, 'A04', 2), (42, 4205, 'A05', 2),
(42, 4206, 'B01', 2), (42, 4207, 'B02', 2), (42, 4208, 'B03', 2), (42, 4209, 'B04', 2), (42, 4210, 'B05', 2),
(42, 4211, 'C01', 2), (42, 4212, 'C02', 2), (42, 4213, 'C03', 2), (42, 4214, 'C04', 2), (42, 4215, 'C05', 2),
(42, 4216, 'D01', 2), (42, 4217, 'D02', 2), (42, 4218, 'D03', 2), (42, 4219, 'D04', 2), (42, 4220, 'D05', 2),

-- Room 43
(43, 4301, 'A01', 2), (43, 4302, 'A02', 2), (43, 4303, 'A03', 2), (43, 4304, 'A04', 2), (43, 4305, 'A05', 2),
(43, 4306, 'B01', 2), (43, 4307, 'B02', 2), (43, 4308, 'B03', 2), (43, 4309, 'B04', 2), (43, 4310, 'B05', 2),
(43, 4311, 'C01', 2), (43, 4312, 'C02', 2), (43, 4313, 'C03', 2), (43, 4314, 'C04', 2), (43, 4315, 'C05', 2),
(43, 4316, 'D01', 2), (43, 4317, 'D02', 2), (43, 4318, 'D03', 2), (43, 4319, 'D04', 2), (43, 4320, 'D05', 2),

-- Room 51
(51, 5101, 'A01', 2), (51, 5102, 'A02', 2), (51, 5103, 'A03', 2), (51, 5104, 'A04', 2), (51, 5105, 'A05', 2),
(51, 5106, 'B01', 2), (51, 5107, 'B02', 2), (51, 5108, 'B03', 2), (51, 5109, 'B04', 2), (51, 5110, 'B05', 2),
(51, 5111, 'C01', 2), (51, 5112, 'C02', 2), (51, 5113, 'C03', 2), (51, 5114, 'C04', 2), (51, 5115, 'C05', 2),
(51, 5116, 'D01', 2), (51, 5117, 'D02', 2), (51, 5118, 'D03', 2), (51, 5119, 'D04', 2), (51, 5120, 'D05', 2),

-- Room 52
(52, 5201, 'A01', 2), (52, 5202, 'A02', 2), (52, 5203, 'A03', 2), (52, 5204, 'A04', 2), (52, 5205, 'A05', 2),
(52, 5206, 'B01', 2), (52, 5207, 'B02', 2), (52, 5208, 'B03', 2), (52, 5209, 'B04', 2), (52, 5210, 'B05', 2),
(52, 5211, 'C01', 2), (52, 5212, 'C02', 2), (52, 5213, 'C03', 2), (52, 5214, 'C04', 2), (52, 5215, 'C05', 2),
(52, 5216, 'D01', 2), (52, 5217, 'D02', 2), (52, 5218, 'D03', 2), (52, 5219, 'D04', 2), (52, 5220, 'D05', 2),

-- Room 53
(53, 5301, 'A01', 2), (53, 5302, 'A02', 2), (53, 5303, 'A03', 2), (53, 5304, 'A04', 2), (53, 5305, 'A05', 2),
(53, 5306, 'B01', 2), (53, 5307, 'B02', 2), (53, 5308, 'B03', 2), (53, 5309, 'B04', 2), (53, 5310, 'B05', 2),
(53, 5311, 'C01', 2), (53, 5312, 'C02', 2), (53, 5313, 'C03', 2), (53, 5314, 'C04', 2), (53, 5315, 'C05', 2),
(53, 5316, 'D01', 2), (53, 5317, 'D02', 2), (53, 5318, 'D03', 2), (53, 5319, 'D04', 2), (53, 5320, 'D05', 2);

INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
-- Room 61
(61, 6101, 'A01', 2), (61, 6102, 'A02', 2), (61, 6103, 'A03', 2), (61, 6104, 'A04', 2), (61, 6105, 'A05', 2),
(61, 6106, 'B01', 2), (61, 6107, 'B02', 2), (61, 6108, 'B03', 2), (61, 6109, 'B04', 2), (61, 6110, 'B05', 2),
(61, 6111, 'C01', 2), (61, 6112, 'C02', 2), (61, 6113, 'C03', 2), (61, 6114, 'C04', 2), (61, 6115, 'C05', 2),
(61, 6116, 'D01', 2), (61, 6117, 'D02', 2), (61, 6118, 'D03', 2), (61, 6119, 'D04', 2), (61, 6120, 'D05', 2),

-- Room 62
(62, 6201, 'A01', 2), (62, 6202, 'A02', 2), (62, 6203, 'A03', 2), (62, 6204, 'A04', 2), (62, 6205, 'A05', 2),
(62, 6206, 'B01', 2), (62, 6207, 'B02', 2), (62, 6208, 'B03', 2), (62, 6209, 'B04', 2), (62, 6210, 'B05', 2),
(62, 6211, 'C01', 2), (62, 6212, 'C02', 2), (62, 6213, 'C03', 2), (62, 6214, 'C04', 2), (62, 6215, 'C05', 2),
(62, 6216, 'D01', 2), (62, 6217, 'D02', 2), (62, 6218, 'D03', 2), (62, 6219, 'D04', 2), (62, 6220, 'D05', 2),

-- Room 63
(63, 6301, 'A01', 2), (63, 6302, 'A02', 2), (63, 6303, 'A03', 2), (63, 6304, 'A04', 2), (63, 6305, 'A05', 2),
(63, 6306, 'B01', 2), (63, 6307, 'B02', 2), (63, 6308, 'B03', 2), (63, 6309, 'B04', 2), (63, 6310, 'B05', 2),
(63, 6311, 'C01', 2), (63, 6312, 'C02', 2), (63, 6313, 'C03', 2), (63, 6314, 'C04', 2), (63, 6315, 'C05', 2),
(63, 6316, 'D01', 2), (63, 6317, 'D02', 2), (63, 6318, 'D03', 2), (63, 6319, 'D04', 2), (63, 6320, 'D05', 2),

-- Room 71
(71, 7101, 'A01', 2), (71, 7102, 'A02', 2), (71, 7103, 'A03', 2), (71, 7104, 'A04', 2), (71, 7105, 'A05', 2),
(71, 7106, 'B01', 2), (71, 7107, 'B02', 2), (71, 7108, 'B03', 2), (71, 7109, 'B04', 2), (71, 7110, 'B05', 2),
(71, 7111, 'C01', 2), (71, 7112, 'C02', 2), (71, 7113, 'C03', 2), (71, 7114, 'C04', 2), (71, 7115, 'C05', 2),
(71, 7116, 'D01', 2), (71, 7117, 'D02', 2), (71, 7118, 'D03', 2), (71, 7119, 'D04', 2), (71, 7120, 'D05', 2),

-- Room 72
(72, 7201, 'A01', 2), (72, 7202, 'A02', 2), (72, 7203, 'A03', 2), (72, 7204, 'A04', 2), (72, 7205, 'A05', 2),
(72, 7206, 'B01', 2), (72, 7207, 'B02', 2), (72, 7208, 'B03', 2), (72, 7209, 'B04', 2), (72, 7210, 'B05', 2),
(72, 7211, 'C01', 2), (72, 7212, 'C02', 2), (72, 7213, 'C03', 2), (72, 7214, 'C04', 2), (72, 7215, 'C05', 2),
(72, 7216, 'D01', 2), (72, 7217, 'D02', 2), (72, 7218, 'D03', 2), (72, 7219, 'D04', 2), (72, 7220, 'D05', 2),

-- Room 73
(73, 7301, 'A01', 2), (73, 7302, 'A02', 2), (73, 7303, 'A03', 2), (73, 7304, 'A04', 2), (73, 7305, 'A05', 2),
(73, 7306, 'B01', 2), (73, 7307, 'B02', 2), (73, 7308, 'B03', 2), (73, 7309, 'B04', 2), (73, 7310, 'B05', 2),
(73, 7311, 'C01', 2), (73, 7312, 'C02', 2), (73, 7313, 'C03', 2), (73, 7314, 'C04', 2), (73, 7315, 'C05', 2),
(73, 7316, 'D01', 2), (73, 7317, 'D02', 2), (73, 7318, 'D03', 2), (73, 7319, 'D04', 2), (73, 7320, 'D05', 2),

-- Room 81
(81, 8101, 'A01', 2), (81, 8102, 'A02', 2), (81, 8103, 'A03', 2), (81, 8104, 'A04', 2), (81, 8105, 'A05', 2),
(81, 8106, 'B01', 2), (81, 8107, 'B02', 2), (81, 8108, 'B03', 2), (81, 8109, 'B04', 2), (81, 8110, 'B05', 2),
(81, 8111, 'C01', 2), (81, 8112, 'C02', 2), (81, 8113, 'C03', 2), (81, 8114, 'C04', 2), (81, 8115, 'C05', 2),
(81, 8116, 'D01', 2), (81, 8117, 'D02', 2), (81, 8118, 'D03', 2), (81, 8119, 'D04', 2), (81, 8120, 'D05', 2),

-- Room 82
(82, 8201, 'A01', 2), (82, 8202, 'A02', 2), (82, 8203, 'A03', 2), (82, 8204, 'A04', 2), (82, 8205, 'A05', 2),
(82, 8206, 'B01', 2), (82, 8207, 'B02', 2), (82, 8208, 'B03', 2), (82, 8209, 'B04', 2), (82, 8210, 'B05', 2),
(82, 8211, 'C01', 2), (82, 8212, 'C02', 2), (82, 8213, 'C03', 2), (82, 8214, 'C04', 2), (82, 8215, 'C05', 2),
(82, 8216, 'D01', 2), (82, 8217, 'D02', 2), (82, 8218, 'D03', 2), (82, 8219, 'D04', 2), (82, 8220, 'D05', 2),

-- Room 83
(83, 8301, 'A01', 2), (83, 8302, 'A02', 2), (83, 8303, 'A03', 2), (83, 8304, 'A04', 2), (83, 8305, 'A05', 2),
(83, 8306, 'B01', 2), (83, 8307, 'B02', 2), (83, 8308, 'B03', 2), (83, 8309, 'B04', 2), (83, 8310, 'B05', 2),
(83, 8311, 'C01', 2), (83, 8312, 'C02', 2), (83, 8313, 'C03', 2), (83, 8314, 'C04', 2), (83, 8315, 'C05', 2),
(83, 8316, 'D01', 2), (83, 8317, 'D02', 2), (83, 8318, 'D03', 2), (83, 8319, 'D04', 2), (83, 8320, 'D05', 2),

-- Room 91
(91, 9101, 'A01', 2), (91, 9102, 'A02', 2), (91, 9103, 'A03', 2), (91, 9104, 'A04', 2), (91, 9105, 'A05', 2),
(91, 9106, 'B01', 2), (91, 9107, 'B02', 2), (91, 9108, 'B03', 2), (91, 9109, 'B04', 2), (91, 9110, 'B05', 2),
(91, 9111, 'C01', 2), (91, 9112, 'C02', 2), (91, 9113, 'C03', 2), (91, 9114, 'C04', 2), (91, 9115, 'C05', 2),
(91, 9116, 'D01', 2), (91, 9117, 'D02', 2), (91, 9118, 'D03', 2), (91, 9119, 'D04', 2), (91, 9120, 'D05', 2),

-- Room 92
(92, 9201, 'A01', 2), (92, 9202, 'A02', 2), (92, 9203, 'A03', 2), (92, 9204, 'A04', 2), (92, 9205, 'A05', 2),
(92, 9206, 'B01', 2), (92, 9207, 'B02', 2), (92, 9208, 'B03', 2), (92, 9209, 'B04', 2), (92, 9210, 'B05', 2),
(92, 9211, 'C01', 2), (92, 9212, 'C02', 2), (92, 9213, 'C03', 2), (92, 9214, 'C04', 2), (92, 9215, 'C05', 2),
(92, 9216, 'D01', 2), (92, 9217, 'D02', 2), (92, 9218, 'D03', 2), (92, 9219, 'D04', 2), (92, 9220, 'D05', 2),

-- Room 93
(93, 9301, 'A01', 2), (93, 9302, 'A02', 2), (93, 9303, 'A03', 2), (93, 9304, 'A04', 2), (93, 9305, 'A05', 2),
(93, 9306, 'B01', 2), (93, 9307, 'B02', 2), (93, 9308, 'B03', 2), (93, 9309, 'B04', 2), (93, 9310, 'B05', 2),
(93, 9311, 'C01', 2), (93, 9312, 'C02', 2), (93, 9313, 'C03', 2), (93, 9314, 'C04', 2), (93, 9315, 'C05', 2),
(93, 9316, 'D01', 2), (93, 9317, 'D02', 2), (93, 9318, 'D03', 2), (93, 9319, 'D04', 2), (93, 9320, 'D05', 2);

INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
-- Room 11
(11, 1101, 'A01', 3), (11, 1102, 'A02', 3), (11, 1103, 'A03', 3), (11, 1104, 'A04', 3), (11, 1105, 'A05', 3),
(11, 1106, 'B01', 3), (11, 1107, 'B02', 3), (11, 1108, 'B03', 3), (11, 1109, 'B04', 3), (11, 1110, 'B05', 3),
(11, 1111, 'C01', 3), (11, 1112, 'C02', 3), (11, 1113, 'C03', 3), (11, 1114, 'C04', 3), (11, 1115, 'C05', 3),
(11, 1116, 'D01', 3), (11, 1117, 'D02', 3), (11, 1118, 'D03', 3), (11, 1119, 'D04', 3), (11, 1120, 'D05', 3),

-- Room 12
(12, 1201, 'A01', 3), (12, 1202, 'A02', 3), (12, 1203, 'A03', 3), (12, 1204, 'A04', 3), (12, 1205, 'A05', 3),
(12, 1206, 'B01', 3), (12, 1207, 'B02', 3), (12, 1208, 'B03', 3), (12, 1209, 'B04', 3), (12, 1210, 'B05', 3),
(12, 1211, 'C01', 3), (12, 1212, 'C02', 3), (12, 1213, 'C03', 3), (12, 1214, 'C04', 3), (12, 1215, 'C05', 3),
(12, 1216, 'D01', 3), (12, 1217, 'D02', 3), (12, 1218, 'D03', 3), (12, 1219, 'D04', 3), (12, 1220, 'D05', 3),

-- Room 13
(13, 1301, 'A01', 3), (13, 1302, 'A02', 3), (13, 1303, 'A03', 3), (13, 1304, 'A04', 3), (13, 1305, 'A05', 3),
(13, 1306, 'B01', 3), (13, 1307, 'B02', 3), (13, 1308, 'B03', 3), (13, 1309, 'B04', 3), (13, 1310, 'B05', 3),
(13, 1311, 'C01', 3), (13, 1312, 'C02', 3), (13, 1313, 'C03', 3), (13, 1314, 'C04', 3), (13, 1315, 'C05', 3),
(13, 1316, 'D01', 3), (13, 1317, 'D02', 3), (13, 1318, 'D03', 3), (13, 1319, 'D04', 3), (13, 1320, 'D05', 3),

-- Room 21
(21, 2101, 'A01', 3), (21, 2102, 'A02', 3), (21, 2103, 'A03', 3), (21, 2104, 'A04', 3), (21, 2105, 'A05', 3),
(21, 2106, 'B01', 3), (21, 2107, 'B02', 3), (21, 2108, 'B03', 3), (21, 2109, 'B04', 3), (21, 2110, 'B05', 3),
(21, 2111, 'C01', 3), (21, 2112, 'C02', 3), (21, 2113, 'C03', 3), (21, 2114, 'C04', 3), (21, 2115, 'C05', 3),
(21, 2116, 'D01', 3), (21, 2117, 'D02', 3), (21, 2118, 'D03', 3), (21, 2119, 'D04', 3), (21, 2120, 'D05', 3),

-- Room 22
(22, 2201, 'A01', 3), (22, 2202, 'A02', 3), (22, 2203, 'A03', 3), (22, 2204, 'A04', 3), (22, 2205, 'A05', 3),
(22, 2206, 'B01', 3), (22, 2207, 'B02', 3), (22, 2208, 'B03', 3), (22, 2209, 'B04', 3), (22, 2210, 'B05', 3),
(22, 2211, 'C01', 3), (22, 2212, 'C02', 3), (22, 2213, 'C03', 3), (22, 2214, 'C04', 3), (22, 2215, 'C05', 3),
(22, 2216, 'D01', 3), (22, 2217, 'D02', 3), (22, 2218, 'D03', 3), (22, 2219, 'D04', 3), (22, 2220, 'D05', 3),

-- Room 23
(23, 2301, 'A01', 3), (23, 2302, 'A02', 3), (23, 2303, 'A03', 3), (23, 2304, 'A04', 3), (23, 2305, 'A05', 3),
(23, 2306, 'B01', 3), (23, 2307, 'B02', 3), (23, 2308, 'B03', 3), (23, 2309, 'B04', 3), (23, 2310, 'B05', 3),
(23, 2311, 'C01', 3), (23, 2312, 'C02', 3), (23, 2313, 'C03', 3), (23, 2314, 'C04', 3), (23, 2315, 'C05', 3),
(23, 2316, 'D01', 3), (23, 2317, 'D02', 3), (23, 2318, 'D03', 3), (23, 2319, 'D04', 3), (23, 2320, 'D05', 3),

-- Room 31
(31, 3101, 'A01', 3), (31, 3102, 'A02', 3), (31, 3103, 'A03', 3), (31, 3104, 'A04', 3), (31, 3105, 'A05', 3),
(31, 3106, 'B01', 3), (31, 3107, 'B02', 3), (31, 3108, 'B03', 3), (31, 3109, 'B04', 3), (31, 3110, 'B05', 3),
(31, 3111, 'C01', 3), (31, 3112, 'C02', 3), (31, 3113, 'C03', 3), (31, 3114, 'C04', 3), (31, 3115, 'C05', 3),
(31, 3116, 'D01', 3), (31, 3117, 'D02', 3), (31, 3118, 'D03', 3), (31, 3119, 'D04', 3), (31, 3120, 'D05', 3),

-- Room 32
(32, 3201, 'A01', 3), (32, 3202, 'A02', 3), (32, 3203, 'A03', 3), (32, 3204, 'A04', 3), (32, 3205, 'A05', 3),
(32, 3206, 'B01', 3), (32, 3207, 'B02', 3), (32, 3208, 'B03', 3), (32, 3209, 'B04', 3), (32, 3210, 'B05', 3),
(32, 3211, 'C01', 3), (32, 3212, 'C02', 3), (32, 3213, 'C03', 3), (32, 3214, 'C04', 3), (32, 3215, 'C05', 3),
(32, 3216, 'D01', 3), (32, 3217, 'D02', 3), (32, 3218, 'D03', 3), (32, 3219, 'D04', 3), (32, 3220, 'D05', 3),

-- Room 33
(33, 3301, 'A01', 3), (33, 3302, 'A02', 3), (33, 3303, 'A03', 3), (33, 3304, 'A04', 3), (33, 3305, 'A05', 3),
(33, 3306, 'B01', 3), (33, 3307, 'B02', 3), (33, 3308, 'B03', 3), (33, 3309, 'B04', 3), (33, 3310, 'B05', 3),
(33, 3311, 'C01', 3), (33, 3312, 'C02', 3), (33, 3313, 'C03', 3), (33, 3314, 'C04', 3), (33, 3315, 'C05', 3),
(33, 3316, 'D01', 3), (33, 3317, 'D02', 3), (33, 3318, 'D03', 3), (33, 3319, 'D04', 3), (33, 3320, 'D05', 3),

-- Room 41
(41, 4101, 'A01', 3), (41, 4102, 'A02', 3), (41, 4103, 'A03', 3), (41, 4104, 'A04', 3), (41, 4105, 'A05', 3),
(41, 4106, 'B01', 3), (41, 4107, 'B02', 3), (41, 4108, 'B03', 3), (41, 4109, 'B04', 3), (41, 4110, 'B05', 3),
(41, 4111, 'C01', 3), (41, 4112, 'C02', 3), (41, 4113, 'C03', 3), (41, 4114, 'C04', 3), (41, 4115, 'C05', 3),
(41, 4116, 'D01', 3), (41, 4117, 'D02', 3), (41, 4118, 'D03', 3), (41, 4119, 'D04', 3), (41, 4120, 'D05', 3),

-- Room 42
(42, 4201, 'A01', 3), (42, 4202, 'A02', 3), (42, 4203, 'A03', 3), (42, 4204, 'A04', 3), (42, 4205, 'A05', 3),
(42, 4206, 'B01', 3), (42, 4207, 'B02', 3), (42, 4208, 'B03', 3), (42, 4209, 'B04', 3), (42, 4210, 'B05', 3),
(42, 4211, 'C01', 3), (42, 4212, 'C02', 3), (42, 4213, 'C03', 3), (42, 4214, 'C04', 3), (42, 4215, 'C05', 3),
(42, 4216, 'D01', 3), (42, 4217, 'D02', 3), (42, 4218, 'D03', 3), (42, 4219, 'D04', 3), (42, 4220, 'D05', 3),

-- Room 43
(43, 4301, 'A01', 3), (43, 4302, 'A02', 3), (43, 4303, 'A03', 3), (43, 4304, 'A04', 3), (43, 4305, 'A05', 3),
(43, 4306, 'B01', 3), (43, 4307, 'B02', 3), (43, 4308, 'B03', 3), (43, 4309, 'B04', 3), (43, 4310, 'B05', 3),
(43, 4311, 'C01', 3), (43, 4312, 'C02', 3), (43, 4313, 'C03', 3), (43, 4314, 'C04', 3), (43, 4315, 'C05', 3),
(43, 4316, 'D01', 3), (43, 4317, 'D02', 3), (43, 4318, 'D03', 3), (43, 4319, 'D04', 3), (43, 4320, 'D05', 3),

-- Room 51
(51, 5101, 'A01', 3), (51, 5102, 'A02', 3), (51, 5103, 'A03', 3), (51, 5104, 'A04', 3), (51, 5105, 'A05', 3),
(51, 5106, 'B01', 3), (51, 5107, 'B02', 3), (51, 5108, 'B03', 3), (51, 5109, 'B04', 3), (51, 5110, 'B05', 3),
(51, 5111, 'C01', 3), (51, 5112, 'C02', 3), (51, 5113, 'C03', 3), (51, 5114, 'C04', 3), (51, 5115, 'C05', 3),
(51, 5116, 'D01', 3), (51, 5117, 'D02', 3), (51, 5118, 'D03', 3), (51, 5119, 'D04', 3), (51, 5120, 'D05', 3),

-- Room 52
(52, 5201, 'A01', 3), (52, 5202, 'A02', 3), (52, 5203, 'A03', 3), (52, 5204, 'A04', 3), (52, 5205, 'A05', 3),
(52, 5206, 'B01', 3), (52, 5207, 'B02', 3), (52, 5208, 'B03', 3), (52, 5209, 'B04', 3), (52, 5210, 'B05', 3),
(52, 5211, 'C01', 3), (52, 5212, 'C02', 3), (52, 5213, 'C03', 3), (52, 5214, 'C04', 3), (52, 5215, 'C05', 3),
(52, 5216, 'D01', 3), (52, 5217, 'D02', 3), (52, 5218, 'D03', 3), (52, 5219, 'D04', 3), (52, 5220, 'D05', 3),

-- Room 53
(53, 5301, 'A01', 3), (53, 5302, 'A02', 3), (53, 5303, 'A03', 3), (53, 5304, 'A04', 3), (53, 5305, 'A05', 3),
(53, 5306, 'B01', 3), (53, 5307, 'B02', 3), (53, 5308, 'B03', 3), (53, 5309, 'B04', 3), (53, 5310, 'B05', 3),
(53, 5311, 'C01', 3), (53, 5312, 'C02', 3), (53, 5313, 'C03', 3), (53, 5314, 'C04', 3), (53, 5315, 'C05', 3),
(53, 5316, 'D01', 3), (53, 5317, 'D02', 3), (53, 5318, 'D03', 3), (53, 5319, 'D04', 3), (53, 5320, 'D05', 3),

-- Room 61
(61, 6101, 'A01', 3), (61, 6102, 'A02', 3), (61, 6103, 'A03', 3), (61, 6104, 'A04', 3), (61, 6105, 'A05', 3),
(61, 6106, 'B01', 3), (61, 6107, 'B02', 3), (61, 6108, 'B03', 3), (61, 6109, 'B04', 3), (61, 6110, 'B05', 3),
(61, 6111, 'C01', 3), (61, 6112, 'C02', 3), (61, 6113, 'C03', 3), (61, 6114, 'C04', 3), (61, 6115, 'C05', 3),
(61, 6116, 'D01', 3), (61, 6117, 'D02', 3), (61, 6118, 'D03', 3), (61, 6119, 'D04', 3), (61, 6120, 'D05', 3),

-- Room 62
(62, 6201, 'A01', 3), (62, 6202, 'A02', 3), (62, 6203, 'A03', 3), (62, 6204, 'A04', 3), (62, 6205, 'A05', 3),
(62, 6206, 'B01', 3), (62, 6207, 'B02', 3), (62, 6208, 'B03', 3), (62, 6209, 'B04', 3), (62, 6210, 'B05', 3),
(62, 6211, 'C01', 3), (62, 6212, 'C02', 3), (62, 6213, 'C03', 3), (62, 6214, 'C04', 3), (62, 6215, 'C05', 3),
(62, 6216, 'D01', 3), (62, 6217, 'D02', 3), (62, 6218, 'D03', 3), (62, 6219, 'D04', 3), (62, 6220, 'D05', 3),

-- Room 63
(63, 6301, 'A01', 3), (63, 6302, 'A02', 3), (63, 6303, 'A03', 3), (63, 6304, 'A04', 3), (63, 6305, 'A05', 3),
(63, 6306, 'B01', 3), (63, 6307, 'B02', 3), (63, 6308, 'B03', 3), (63, 6309, 'B04', 3), (63, 6310, 'B05', 3),
(63, 6311, 'C01', 3), (63, 6312, 'C02', 3), (63, 6313, 'C03', 3), (63, 6314, 'C04', 3), (63, 6315, 'C05', 3),
(63, 6316, 'D01', 3), (63, 6317, 'D02', 3), (63, 6318, 'D03', 3), (63, 6319, 'D04', 3), (63, 6320, 'D05', 3),

-- Room 71
(71, 7101, 'A01', 3), (71, 7102, 'A02', 3), (71, 7103, 'A03', 3), (71, 7104, 'A04', 3), (71, 7105, 'A05', 3),
(71, 7106, 'B01', 3), (71, 7107, 'B02', 3), (71, 7108, 'B03', 3), (71, 7109, 'B04', 3), (71, 7110, 'B05', 3),
(71, 7111, 'C01', 3), (71, 7112, 'C02', 3), (71, 7113, 'C03', 3), (71, 7114, 'C04', 3), (71, 7115, 'C05', 3),
(71, 7116, 'D01', 3), (71, 7117, 'D02', 3), (71, 7118, 'D03', 3), (71, 7119, 'D04', 3), (71, 7120, 'D05', 3),

-- Room 72
(72, 7201, 'A01', 3), (72, 7202, 'A02', 3), (72, 7203, 'A03', 3), (72, 7204, 'A04', 3), (72, 7205, 'A05', 3),
(72, 7206, 'B01', 3), (72, 7207, 'B02', 3), (72, 7208, 'B03', 3), (72, 7209, 'B04', 3), (72, 7210, 'B05', 3),
(72, 7211, 'C01', 3), (72, 7212, 'C02', 3), (72, 7213, 'C03', 3), (72, 7214, 'C04', 3), (72, 7215, 'C05', 3),
(72, 7216, 'D01', 3), (72, 7217, 'D02', 3), (72, 7218, 'D03', 3), (72, 7219, 'D04', 3), (72, 7220, 'D05', 3),

-- Room 73
(73, 7301, 'A01', 3), (73, 7302, 'A02', 3), (73, 7303, 'A03', 3), (73, 7304, 'A04', 3), (73, 7305, 'A05', 3),
(73, 7306, 'B01', 3), (73, 7307, 'B02', 3), (73, 7308, 'B03', 3), (73, 7309, 'B04', 3), (73, 7310, 'B05', 3),
(73, 7311, 'C01', 3), (73, 7312, 'C02', 3), (73, 7313, 'C03', 3), (73, 7314, 'C04', 3), (73, 7315, 'C05', 3),
(73, 7316, 'D01', 3), (73, 7317, 'D02', 3), (73, 7318, 'D03', 3), (73, 7319, 'D04', 3), (73, 7320, 'D05', 3),

-- Room 81
(81, 8101, 'A01', 3), (81, 8102, 'A02', 3), (81, 8103, 'A03', 3), (81, 8104, 'A04', 3), (81, 8105, 'A05', 3),
(81, 8106, 'B01', 3), (81, 8107, 'B02', 3), (81, 8108, 'B03', 3), (81, 8109, 'B04', 3), (81, 8110, 'B05', 3),
(81, 8111, 'C01', 3), (81, 8112, 'C02', 3), (81, 8113, 'C03', 3), (81, 8114, 'C04', 3), (81, 8115, 'C05', 3),
(81, 8116, 'D01', 3), (81, 8117, 'D02', 3), (81, 8118, 'D03', 3), (81, 8119, 'D04', 3), (81, 8120, 'D05', 3),

-- Room 82
(82, 8201, 'A01', 3), (82, 8202, 'A02', 3), (82, 8203, 'A03', 3), (82, 8204, 'A04', 3), (82, 8205, 'A05', 3),
(82, 8206, 'B01', 3), (82, 8207, 'B02', 3), (82, 8208, 'B03', 3), (82, 8209, 'B04', 3), (82, 8210, 'B05', 3),
(82, 8211, 'C01', 3), (82, 8212, 'C02', 3), (82, 8213, 'C03', 3), (82, 8214, 'C04', 3), (82, 8215, 'C05', 3),
(82, 8216, 'D01', 3), (82, 8217, 'D02', 3), (82, 8218, 'D03', 3), (82, 8219, 'D04', 3), (82, 8220, 'D05', 3),

-- Room 83
(83, 8301, 'A01', 3), (83, 8302, 'A02', 3), (83, 8303, 'A03', 3), (83, 8304, 'A04', 3), (83, 8305, 'A05', 3),
(83, 8306, 'B01', 3), (83, 8307, 'B02', 3), (83, 8308, 'B03', 3), (83, 8309, 'B04', 3), (83, 8310, 'B05', 3),
(83, 8311, 'C01', 3), (83, 8312, 'C02', 3), (83, 8313, 'C03', 3), (83, 8314, 'C04', 3), (83, 8315, 'C05', 3),
(83, 8316, 'D01', 3), (83, 8317, 'D02', 3), (83, 8318, 'D03', 3), (83, 8319, 'D04', 3), (83, 8320, 'D05', 3),

-- Room 91
(91, 9101, 'A01', 3), (91, 9102, 'A02', 3), (91, 9103, 'A03', 3), (91, 9104, 'A04', 3), (91, 9105, 'A05', 3),
(91, 9106, 'B01', 3), (91, 9107, 'B02', 3), (91, 9108, 'B03', 3), (91, 9109, 'B04', 3), (91, 9110, 'B05', 3),
(91, 9111, 'C01', 3), (91, 9112, 'C02', 3), (91, 9113, 'C03', 3), (91, 9114, 'C04', 3), (91, 9115, 'C05', 3),
(91, 9116, 'D01', 3), (91, 9117, 'D02', 3), (91, 9118, 'D03', 3), (91, 9119, 'D04', 3), (91, 9120, 'D05', 3),

-- Room 92
(92, 9201, 'A01', 3), (92, 9202, 'A02', 3), (92, 9203, 'A03', 3), (92, 9204, 'A04', 3), (92, 9205, 'A05', 3),
(92, 9206, 'B01', 3), (92, 9207, 'B02', 3), (92, 9208, 'B03', 3), (92, 9209, 'B04', 3), (92, 9210, 'B05', 3),
(92, 9211, 'C01', 3), (92, 9212, 'C02', 3), (92, 9213, 'C03', 3), (92, 9214, 'C04', 3), (92, 9215, 'C05', 3),
(92, 9216, 'D01', 3), (92, 9217, 'D02', 3), (92, 9218, 'D03', 3), (92, 9219, 'D04', 3), (92, 9220, 'D05', 3),

-- Room 93
(93, 9301, 'A01', 3), (93, 9302, 'A02', 3), (93, 9303, 'A03', 3), (93, 9304, 'A04', 3), (93, 9305, 'A05', 3),
(93, 9306, 'B01', 3), (93, 9307, 'B02', 3), (93, 9308, 'B03', 3), (93, 9309, 'B04', 3), (93, 9310, 'B05', 3),
(93, 9311, 'C01', 3), (93, 9312, 'C02', 3), (93, 9313, 'C03', 3), (93, 9314, 'C04', 3), (93, 9315, 'C05', 3),
(93, 9316, 'D01', 3), (93, 9317, 'D02', 3), (93, 9318, 'D03', 3), (93, 9319, 'D04', 3), (93, 9320, 'D05', 3);

-- Room 11
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(11, 1101, 'A01', 4), (11, 1102, 'A02', 4), (11, 1103, 'A03', 4), (11, 1104, 'A04', 4), (11, 1105, 'A05', 4),
(11, 1106, 'B01', 4), (11, 1107, 'B02', 4), (11, 1108, 'B03', 4), (11, 1109, 'B04', 4), (11, 1110, 'B05', 4),
(11, 1111, 'C01', 4), (11, 1112, 'C02', 4), (11, 1113, 'C03', 4), (11, 1114, 'C04', 4), (11, 1115, 'C05', 4),
(11, 1116, 'D01', 4), (11, 1117, 'D02', 4), (11, 1118, 'D03', 4), (11, 1119, 'D04', 4), (11, 1120, 'D05', 4),

-- Room 12
(12, 1201, 'A01', 4), (12, 1202, 'A02', 4), (12, 1203, 'A03', 4), (12, 1204, 'A04', 4), (12, 1205, 'A05', 4),
(12, 1206, 'B01', 4), (12, 1207, 'B02', 4), (12, 1208, 'B03', 4), (12, 1209, 'B04', 4), (12, 1210, 'B05', 4),
(12, 1211, 'C01', 4), (12, 1212, 'C02', 4), (12, 1213, 'C03', 4), (12, 1214, 'C04', 4), (12, 1215, 'C05', 4),
(12, 1216, 'D01', 4), (12, 1217, 'D02', 4), (12, 1218, 'D03', 4), (12, 1219, 'D04', 4), (12, 1220, 'D05', 4),

-- Room 13
(13, 1301, 'A01', 4), (13, 1302, 'A02', 4), (13, 1303, 'A03', 4), (13, 1304, 'A04', 4), (13, 1305, 'A05', 4),
(13, 1306, 'B01', 4), (13, 1307, 'B02', 4), (13, 1308, 'B03', 4), (13, 1309, 'B04', 4), (13, 1310, 'B05', 4),
(13, 1311, 'C01', 4), (13, 1312, 'C02', 4), (13, 1313, 'C03', 4), (13, 1314, 'C04', 4), (13, 1315, 'C05', 4),
(13, 1316, 'D01', 4), (13, 1317, 'D02', 4), (13, 1318, 'D03', 4), (13, 1319, 'D04', 4), (13, 1320, 'D05', 4),

-- Room 21
(21, 2101, 'A01', 4), (21, 2102, 'A02', 4), (21, 2103, 'A03', 4), (21, 2104, 'A04', 4), (21, 2105, 'A05', 4),
(21, 2106, 'B01', 4), (21, 2107, 'B02', 4), (21, 2108, 'B03', 4), (21, 2109, 'B04', 4), (21, 2110, 'B05', 4),
(21, 2111, 'C01', 4), (21, 2112, 'C02', 4), (21, 2113, 'C03', 4), (21, 2114, 'C04', 4), (21, 2115, 'C05', 4),
(21, 2116, 'D01', 4), (21, 2117, 'D02', 4), (21, 2118, 'D03', 4), (21, 2119, 'D04', 4), (21, 2120, 'D05', 4),

-- Room 22
(22, 2201, 'A01', 4), (22, 2202, 'A02', 4), (22, 2203, 'A03', 4), (22, 2204, 'A04', 4), (22, 2205, 'A05', 4),
(22, 2206, 'B01', 4), (22, 2207, 'B02', 4), (22, 2208, 'B03', 4), (22, 2209, 'B04', 4), (22, 2210, 'B05', 4),
(22, 2211, 'C01', 4), (22, 2212, 'C02', 4), (22, 2213, 'C03', 4), (22, 2214, 'C04', 4), (22, 2215, 'C05', 4),
(22, 2216, 'D01', 4), (22, 2217, 'D02', 4), (22, 2218, 'D03', 4), (22, 2219, 'D04', 4), (22, 2220, 'D05', 4),

-- Room 23
(23, 2301, 'A01', 4), (23, 2302, 'A02', 4), (23, 2303, 'A03', 4), (23, 2304, 'A04', 4), (23, 2305, 'A05', 4),
(23, 2306, 'B01', 4), (23, 2307, 'B02', 4), (23, 2308, 'B03', 4), (23, 2309, 'B04', 4), (23, 2310, 'B05', 4),
(23, 2311, 'C01', 4), (23, 2312, 'C02', 4), (23, 2313, 'C03', 4), (23, 2314, 'C04', 4), (23, 2315, 'C05', 4),
(23, 2316, 'D01', 4), (23, 2317, 'D02', 4), (23, 2318, 'D03', 4), (23, 2319, 'D04', 4), (23, 2320, 'D05', 4),

-- Room 31
(31, 3101, 'A01', 4), (31, 3102, 'A02', 4), (31, 3103, 'A03', 4), (31, 3104, 'A04', 4), (31, 3105, 'A05', 4),
(31, 3106, 'B01', 4), (31, 3107, 'B02', 4), (31, 3108, 'B03', 4), (31, 3109, 'B04', 4), (31, 3110, 'B05', 4),
(31, 3111, 'C01', 4), (31, 3112, 'C02', 4), (31, 3113, 'C03', 4), (31, 3114, 'C04', 4), (31, 3115, 'C05', 4),
(31, 3116, 'D01', 4), (31, 3117, 'D02', 4), (31, 3118, 'D03', 4), (31, 3119, 'D04', 4), (31, 3120, 'D05', 4),

-- Room 32
(32, 3201, 'A01', 4), (32, 3202, 'A02', 4), (32, 3203, 'A03', 4), (32, 3204, 'A04', 4), (32, 3205, 'A05', 4),
(32, 3206, 'B01', 4), (32, 3207, 'B02', 4), (32, 3208, 'B03', 4), (32, 3209, 'B04', 4), (32, 3210, 'B05', 4),
(32, 3211, 'C01', 4), (32, 3212, 'C02', 4), (32, 3213, 'C03', 4), (32, 3214, 'C04', 4), (32, 3215, 'C05', 4),
(32, 3216, 'D01', 4), (32, 3217, 'D02', 4), (32, 3218, 'D03', 4), (32, 3219, 'D04', 4), (32, 3220, 'D05', 4),

-- Room 33
(33, 3301, 'A01', 4), (33, 3302, 'A02', 4), (33, 3303, 'A03', 4), (33, 3304, 'A04', 4), (33, 3305, 'A05', 4),
(33, 3306, 'B01', 4), (33, 3307, 'B02', 4), (33, 3308, 'B03', 4), (33, 3309, 'B04', 4), (33, 3310, 'B05', 4),
(33, 3311, 'C01', 4), (33, 3312, 'C02', 4), (33, 3313, 'C03', 4), (33, 3314, 'C04', 4), (33, 3315, 'C05', 4),
(33, 3316, 'D01', 4), (33, 3317, 'D02', 4), (33, 3318, 'D03', 4), (33, 3319, 'D04', 4), (33, 3320, 'D05', 4),

-- Room 41
(41, 4101, 'A01', 4), (41, 4102, 'A02', 4), (41, 4103, 'A03', 4), (41, 4104, 'A04', 4), (41, 4105, 'A05', 4),
(41, 4106, 'B01', 4), (41, 4107, 'B02', 4), (41, 4108, 'B03', 4), (41, 4109, 'B04', 4), (41, 4110, 'B05', 4),
(41, 4111, 'C01', 4), (41, 4112, 'C02', 4), (41, 4113, 'C03', 4), (41, 4114, 'C04', 4), (41, 4115, 'C05', 4),
(41, 4116, 'D01', 4), (41, 4117, 'D02', 4), (41, 4118, 'D03', 4), (41, 4119, 'D04', 4), (41, 4120, 'D05', 4),

-- Room 42
(42, 4201, 'A01', 4), (42, 4202, 'A02', 4), (42, 4203, 'A03', 4), (42, 4204, 'A04', 4), (42, 4205, 'A05', 4),
(42, 4206, 'B01', 4), (42, 4207, 'B02', 4), (42, 4208, 'B03', 4), (42, 4209, 'B04', 4), (42, 4210, 'B05', 4),
(42, 4211, 'C01', 4), (42, 4212, 'C02', 4), (42, 4213, 'C03', 4), (42, 4214, 'C04', 4), (42, 4215, 'C05', 4),
(42, 4216, 'D01', 4), (42, 4217, 'D02', 4), (42, 4218, 'D03', 4), (42, 4219, 'D04', 4), (42, 4220, 'D05', 4),

-- Room 43
(43, 4301, 'A01', 4), (43, 4302, 'A02', 4), (43, 4303, 'A03', 4), (43, 4304, 'A04', 4), (43, 4305, 'A05', 4),
(43, 4306, 'B01', 4), (43, 4307, 'B02', 4), (43, 4308, 'B03', 4), (43, 4309, 'B04', 4), (43, 4310, 'B05', 4),
(43, 4311, 'C01', 4), (43, 4312, 'C02', 4), (43, 4313, 'C03', 4), (43, 4314, 'C04', 4), (43, 4315, 'C05', 4),
(43, 4316, 'D01', 4), (43, 4317, 'D02', 4), (43, 4318, 'D03', 4), (43, 4319, 'D04', 4), (43, 4320, 'D05', 4),

-- Room 51
(51, 5101, 'A01', 4), (51, 5102, 'A02', 4), (51, 5103, 'A03', 4), (51, 5104, 'A04', 4), (51, 5105, 'A05', 4),
(51, 5106, 'B01', 4), (51, 5107, 'B02', 4), (51, 5108, 'B03', 4), (51, 5109, 'B04', 4), (51, 5110, 'B05', 4),
(51, 5111, 'C01', 4), (51, 5112, 'C02', 4), (51, 5113, 'C03', 4), (51, 5114, 'C04', 4), (51, 5115, 'C05', 4),
(51, 5116, 'D01', 4), (51, 5117, 'D02', 4), (51, 5118, 'D03', 4), (51, 5119, 'D04', 4), (51, 5120, 'D05', 4),

-- Room 52
(52, 5201, 'A01', 4), (52, 5202, 'A02', 4), (52, 5203, 'A03', 4), (52, 5204, 'A04', 4), (52, 5205, 'A05', 4),
(52, 5206, 'B01', 4), (52, 5207, 'B02', 4), (52, 5208, 'B03', 4), (52, 5209, 'B04', 4), (52, 5210, 'B05', 4),
(52, 5211, 'C01', 4), (52, 5212, 'C02', 4), (52, 5213, 'C03', 4), (52, 5214, 'C04', 4), (52, 5215, 'C05', 4),
(52, 5216, 'D01', 4), (52, 5217, 'D02', 4), (52, 5218, 'D03', 4), (52, 5219, 'D04', 4), (52, 5220, 'D05', 4),

-- Room 53
(53, 5301, 'A01', 4), (53, 5302, 'A02', 4), (53, 5303, 'A03', 4), (53, 5304, 'A04', 4), (53, 5305, 'A05', 4),
(53, 5306, 'B01', 4), (53, 5307, 'B02', 4), (53, 5308, 'B03', 4), (53, 5309, 'B04', 4), (53, 5310, 'B05', 4),
(53, 5311, 'C01', 4), (53, 5312, 'C02', 4), (53, 5313, 'C03', 4), (53, 5314, 'C04', 4), (53, 5315, 'C05', 4),
(53, 5316, 'D01', 4), (53, 5317, 'D02', 4), (53, 5318, 'D03', 4), (53, 5319, 'D04', 4), (53, 5320, 'D05', 4),

-- Room 61
(61, 6101, 'A01', 4), (61, 6102, 'A02', 4), (61, 6103, 'A03', 4), (61, 6104, 'A04', 4), (61, 6105, 'A05', 4),
(61, 6106, 'B01', 4), (61, 6107, 'B02', 4), (61, 6108, 'B03', 4), (61, 6109, 'B04', 4), (61, 6110, 'B05', 4),
(61, 6111, 'C01', 4), (61, 6112, 'C02', 4), (61, 6113, 'C03', 4), (61, 6114, 'C04', 4), (61, 6115, 'C05', 4),
(61, 6116, 'D01', 4), (61, 6117, 'D02', 4), (61, 6118, 'D03', 4), (61, 6119, 'D04', 4), (61, 6120, 'D05', 4),

-- Room 62
(62, 6201, 'A01', 4), (62, 6202, 'A02', 4), (62, 6203, 'A03', 4), (62, 6204, 'A04', 4), (62, 6205, 'A05', 4),
(62, 6206, 'B01', 4), (62, 6207, 'B02', 4), (62, 6208, 'B03', 4), (62, 6209, 'B04', 4), (62, 6210, 'B05', 4),
(62, 6211, 'C01', 4), (62, 6212, 'C02', 4), (62, 6213, 'C03', 4), (62, 6214, 'C04', 4), (62, 6215, 'C05', 4),
(62, 6216, 'D01', 4), (62, 6217, 'D02', 4), (62, 6218, 'D03', 4), (62, 6219, 'D04', 4), (62, 6220, 'D05', 4),

-- Room 63
(63, 6301, 'A01', 4), (63, 6302, 'A02', 4), (63, 6303, 'A03', 4), (63, 6304, 'A04', 4), (63, 6305, 'A05', 4),
(63, 6306, 'B01', 4), (63, 6307, 'B02', 4), (63, 6308, 'B03', 4), (63, 6309, 'B04', 4), (63, 6310, 'B05', 4),
(63, 6311, 'C01', 4), (63, 6312, 'C02', 4), (63, 6313, 'C03', 4), (63, 6314, 'C04', 4), (63, 6315, 'C05', 4),
(63, 6316, 'D01', 4), (63, 6317, 'D02', 4), (63, 6318, 'D03', 4), (63, 6319, 'D04', 4), (63, 6320, 'D05', 4),

-- Room 71
(71, 7101, 'A01', 4), (71, 7102, 'A02', 4), (71, 7103, 'A03', 4), (71, 7104, 'A04', 4), (71, 7105, 'A05', 4),
(71, 7106, 'B01', 4), (71, 7107, 'B02', 4), (71, 7108, 'B03', 4), (71, 7109, 'B04', 4), (71, 7110, 'B05', 4),
(71, 7111, 'C01', 4), (71, 7112, 'C02', 4), (71, 7113, 'C03', 4), (71, 7114, 'C04', 4), (71, 7115, 'C05', 4),
(71, 7116, 'D01', 4), (71, 7117, 'D02', 4), (71, 7118, 'D03', 4), (71, 7119, 'D04', 4), (71, 7120, 'D05', 4),

-- Room 72
(72, 7201, 'A01', 4), (72, 7202, 'A02', 4), (72, 7203, 'A03', 4), (72, 7204, 'A04', 4), (72, 7205, 'A05', 4),
(72, 7206, 'B01', 4), (72, 7207, 'B02', 4), (72, 7208, 'B03', 4), (72, 7209, 'B04', 4), (72, 7210, 'B05', 4),
(72, 7211, 'C01', 4), (72, 7212, 'C02', 4), (72, 7213, 'C03', 4), (72, 7214, 'C04', 4), (72, 7215, 'C05', 4),
(72, 7216, 'D01', 4), (72, 7217, 'D02', 4), (72, 7218, 'D03', 4), (72, 7219, 'D04', 4), (72, 7220, 'D05', 4),

-- Room 73
(73, 7301, 'A01', 4), (73, 7302, 'A02', 4), (73, 7303, 'A03', 4), (73, 7304, 'A04', 4), (73, 7305, 'A05', 4),
(73, 7306, 'B01', 4), (73, 7307, 'B02', 4), (73, 7308, 'B03', 4), (73, 7309, 'B04', 4), (73, 7310, 'B05', 4),
(73, 7311, 'C01', 4), (73, 7312, 'C02', 4), (73, 7313, 'C03', 4), (73, 7314, 'C04', 4), (73, 7315, 'C05', 4),
(73, 7316, 'D01', 4), (73, 7317, 'D02', 4), (73, 7318, 'D03', 4), (73, 7319, 'D04', 4), (73, 7320, 'D05', 4),

-- Room 81
(81, 8101, 'A01', 4), (81, 8102, 'A02', 4), (81, 8103, 'A03', 4), (81, 8104, 'A04', 4), (81, 8105, 'A05', 4),
(81, 8106, 'B01', 4), (81, 8107, 'B02', 4), (81, 8108, 'B03', 4), (81, 8109, 'B04', 4), (81, 8110, 'B05', 4),
(81, 8111, 'C01', 4), (81, 8112, 'C02', 4), (81, 8113, 'C03', 4), (81, 8114, 'C04', 4), (81, 8115, 'C05', 4),
(81, 8116, 'D01', 4), (81, 8117, 'D02', 4), (81, 8118, 'D03', 4), (81, 8119, 'D04', 4), (81, 8120, 'D05', 4),

-- Room 82
(82, 8201, 'A01', 4), (82, 8202, 'A02', 4), (82, 8203, 'A03', 4), (82, 8204, 'A04', 4), (82, 8205, 'A05', 4),
(82, 8206, 'B01', 4), (82, 8207, 'B02', 4), (82, 8208, 'B03', 4), (82, 8209, 'B04', 4), (82, 8210, 'B05', 4),
(82, 8211, 'C01', 4), (82, 8212, 'C02', 4), (82, 8213, 'C03', 4), (82, 8214, 'C04', 4), (82, 8215, 'C05', 4),
(82, 8216, 'D01', 4), (82, 8217, 'D02', 4), (82, 8218, 'D03', 4), (82, 8219, 'D04', 4), (82, 8220, 'D05', 4),

-- Room 83
(83, 8301, 'A01', 4), (83, 8302, 'A02', 4), (83, 8303, 'A03', 4), (83, 8304, 'A04', 4), (83, 8305, 'A05', 4),
(83, 8306, 'B01', 4), (83, 8307, 'B02', 4), (83, 8308, 'B03', 4), (83, 8309, 'B04', 4), (83, 8310, 'B05', 4),
(83, 8311, 'C01', 4), (83, 8312, 'C02', 4), (83, 8313, 'C03', 4), (83, 8314, 'C04', 4), (83, 8315, 'C05', 4),
(83, 8316, 'D01', 4), (83, 8317, 'D02', 4), (83, 8318, 'D03', 4), (83, 8319, 'D04', 4), (83, 8320, 'D05', 4),

-- Room 91
(91, 9101, 'A01', 4), (91, 9102, 'A02', 4), (91, 9103, 'A03', 4), (91, 9104, 'A04', 4), (91, 9105, 'A05', 4),
(91, 9106, 'B01', 4), (91, 9107, 'B02', 4), (91, 9108, 'B03', 4), (91, 9109, 'B04', 4), (91, 9110, 'B05', 4),
(91, 9111, 'C01', 4), (91, 9112, 'C02', 4), (91, 9113, 'C03', 4), (91, 9114, 'C04', 4), (91, 9115, 'C05', 4),
(91, 9116, 'D01', 4), (91, 9117, 'D02', 4), (91, 9118, 'D03', 4), (91, 9119, 'D04', 4), (91, 9120, 'D05', 4),

-- Room 92
(92, 9201, 'A01', 4), (92, 9202, 'A02', 4), (92, 9203, 'A03', 4), (92, 9204, 'A04', 4), (92, 9205, 'A05', 4),
(92, 9206, 'B01', 4), (92, 9207, 'B02', 4), (92, 9208, 'B03', 4), (92, 9209, 'B04', 4), (92, 9210, 'B05', 4),
(92, 9211, 'C01', 4), (92, 9212, 'C02', 4), (92, 9213, 'C03', 4), (92, 9214, 'C04', 4), (92, 9215, 'C05', 4),
(92, 9216, 'D01', 4), (92, 9217, 'D02', 4), (92, 9218, 'D03', 4), (92, 9219, 'D04', 4), (92, 9220, 'D05', 4),

-- Room 93
(93, 9301, 'A01', 4), (93, 9302, 'A02', 4), (93, 9303, 'A03', 4), (93, 9304, 'A04', 4), (93, 9305, 'A05', 4),
(93, 9306, 'B01', 4), (93, 9307, 'B02', 4), (93, 9308, 'B03', 4), (93, 9309, 'B04', 4), (93, 9310, 'B05', 4),
(93, 9311, 'C01', 4), (93, 9312, 'C02', 4), (93, 9313, 'C03', 4), (93, 9314, 'C04', 4), (93, 9315, 'C05', 4),
(93, 9316, 'D01', 4), (93, 9317, 'D02', 4), (93, 9318, 'D03', 4), (93, 9319, 'D04', 4), (93, 9320, 'D05', 4);

-- Room 11
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(11, 1101, 'A01', 5), (11, 1102, 'A02', 5), (11, 1103, 'A03', 5), (11, 1104, 'A04', 5), (11, 1105, 'A05', 5),
(11, 1106, 'B01', 5), (11, 1107, 'B02', 5), (11, 1108, 'B03', 5), (11, 1109, 'B04', 5), (11, 1110, 'B05', 5),
(11, 1111, 'C01', 5), (11, 1112, 'C02', 5), (11, 1113, 'C03', 5), (11, 1114, 'C04', 5), (11, 1115, 'C05', 5),
(11, 1116, 'D01', 5), (11, 1117, 'D02', 5), (11, 1118, 'D03', 5), (11, 1119, 'D04', 5), (11, 1120, 'D05', 5),

-- Room 12
(12, 1201, 'A01', 5), (12, 1202, 'A02', 5), (12, 1203, 'A03', 5), (12, 1204, 'A04', 5), (12, 1205, 'A05', 5),
(12, 1206, 'B01', 5), (12, 1207, 'B02', 5), (12, 1208, 'B03', 5), (12, 1209, 'B04', 5), (12, 1210, 'B05', 5),
(12, 1211, 'C01', 5), (12, 1212, 'C02', 5), (12, 1213, 'C03', 5), (12, 1214, 'C04', 5), (12, 1215, 'C05', 5),
(12, 1216, 'D01', 5), (12, 1217, 'D02', 5), (12, 1218, 'D03', 5), (12, 1219, 'D04', 5), (12, 1220, 'D05', 5),

-- Room 13
(13, 1301, 'A01', 5), (13, 1302, 'A02', 5), (13, 1303, 'A03', 5), (13, 1304, 'A04', 5), (13, 1305, 'A05', 5),
(13, 1306, 'B01', 5), (13, 1307, 'B02', 5), (13, 1308, 'B03', 5), (13, 1309, 'B04', 5), (13, 1310, 'B05', 5),
(13, 1311, 'C01', 5), (13, 1312, 'C02', 5), (13, 1313, 'C03', 5), (13, 1314, 'C04', 5), (13, 1315, 'C05', 5),
(13, 1316, 'D01', 5), (13, 1317, 'D02', 5), (13, 1318, 'D03', 5), (13, 1319, 'D04', 5), (13, 1320, 'D05', 5),

-- Room 21
(21, 2101, 'A01', 5), (21, 2102, 'A02', 5), (21, 2103, 'A03', 5), (21, 2104, 'A04', 5), (21, 2105, 'A05', 5),
(21, 2106, 'B01', 5), (21, 2107, 'B02', 5), (21, 2108, 'B03', 5), (21, 2109, 'B04', 5), (21, 2110, 'B05', 5),
(21, 2111, 'C01', 5), (21, 2112, 'C02', 5), (21, 2113, 'C03', 5), (21, 2114, 'C04', 5), (21, 2115, 'C05', 5),
(21, 2116, 'D01', 5), (21, 2117, 'D02', 5), (21, 2118, 'D03', 5), (21, 2119, 'D04', 5), (21, 2120, 'D05', 5),

-- Room 22
(22, 2201, 'A01', 5), (22, 2202, 'A02', 5), (22, 2203, 'A03', 5), (22, 2204, 'A04', 5), (22, 2205, 'A05', 5),
(22, 2206, 'B01', 5), (22, 2207, 'B02', 5), (22, 2208, 'B03', 5), (22, 2209, 'B04', 5), (22, 2210, 'B05', 5),
(22, 2211, 'C01', 5), (22, 2212, 'C02', 5), (22, 2213, 'C03', 5), (22, 2214, 'C04', 5), (22, 2215, 'C05', 5),
(22, 2216, 'D01', 5), (22, 2217, 'D02', 5), (22, 2218, 'D03', 5), (22, 2219, 'D04', 5), (22, 2220, 'D05', 5),

-- Room 23
(23, 2301, 'A01', 5), (23, 2302, 'A02', 5), (23, 2303, 'A03', 5), (23, 2304, 'A04', 5), (23, 2305, 'A05', 5),
(23, 2306, 'B01', 5), (23, 2307, 'B02', 5), (23, 2308, 'B03', 5), (23, 2309, 'B04', 5), (23, 2310, 'B05', 5),
(23, 2311, 'C01', 5), (23, 2312, 'C02', 5), (23, 2313, 'C03', 5), (23, 2314, 'C04', 5), (23, 2315, 'C05', 5),
(23, 2316, 'D01', 5), (23, 2317, 'D02', 5), (23, 2318, 'D03', 5), (23, 2319, 'D04', 5), (23, 2320, 'D05', 5),

-- Room 31
(31, 3101, 'A01', 5), (31, 3102, 'A02', 5), (31, 3103, 'A03', 5), (31, 3104, 'A04', 5), (31, 3105, 'A05', 5),
(31, 3106, 'B01', 5), (31, 3107, 'B02', 5), (31, 3108, 'B03', 5), (31, 3109, 'B04', 5), (31, 3110, 'B05', 5),
(31, 3111, 'C01', 5), (31, 3112, 'C02', 5), (31, 3113, 'C03', 5), (31, 3114, 'C04', 5), (31, 3115, 'C05', 5),
(31, 3116, 'D01', 5), (31, 3117, 'D02', 5), (31, 3118, 'D03', 5), (31, 3119, 'D04', 5), (31, 3120, 'D05', 5),

-- Room 32
(32, 3201, 'A01', 5), (32, 3202, 'A02', 5), (32, 3203, 'A03', 5), (32, 3204, 'A04', 5), (32, 3205, 'A05', 5),
(32, 3206, 'B01', 5), (32, 3207, 'B02', 5), (32, 3208, 'B03', 5), (32, 3209, 'B04', 5), (32, 3210, 'B05', 5),
(32, 3211, 'C01', 5), (32, 3212, 'C02', 5), (32, 3213, 'C03', 5), (32, 3214, 'C04', 5), (32, 3215, 'C05', 5),
(32, 3216, 'D01', 5), (32, 3217, 'D02', 5), (32, 3218, 'D03', 5), (32, 3219, 'D04', 5), (32, 3220, 'D05', 5),

(33, 3301, 'A01', 5), (33, 3302, 'A02', 5), (33, 3303, 'A03', 5), (33, 3304, 'A04', 5), (33, 3305, 'A05', 5),
(33, 3306, 'B01', 5), (33, 3307, 'B02', 5), (33, 3308, 'B03', 5), (33, 3309, 'B04', 5), (33, 3310, 'B05', 5),
(33, 3311, 'C01', 5), (33, 3312, 'C02', 5), (33, 3313, 'C03', 5), (33, 3314, 'C04', 5), (33, 3315, 'C05', 5),
(33, 3316, 'D01', 5), (33, 3317, 'D02', 5), (33, 3318, 'D03', 5), (33, 3319, 'D04', 5), (33, 3320, 'D05', 5);

-- Room 41
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(41, 4101, 'A01', 5), (41, 4102, 'A02', 5), (41, 4103, 'A03', 5), (41, 4104, 'A04', 5), (41, 4105, 'A05', 5),
(41, 4106, 'B01', 5), (41, 4107, 'B02', 5), (41, 4108, 'B03', 5), (41, 4109, 'B04', 5), (41, 4110, 'B05', 5),
(41, 4111, 'C01', 5), (41, 4112, 'C02', 5), (41, 4113, 'C03', 5), (41, 4114, 'C04', 5), (41, 4115, 'C05', 5),
(41, 4116, 'D01', 5), (41, 4117, 'D02', 5), (41, 4118, 'D03', 5), (41, 4119, 'D04', 5), (41, 4120, 'D05', 5);

-- Room 42
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(42, 4201, 'A01', 5), (42, 4202, 'A02', 5), (42, 4203, 'A03', 5), (42, 4204, 'A04', 5), (42, 4205, 'A05', 5),
(42, 4206, 'B01', 5), (42, 4207, 'B02', 5), (42, 4208, 'B03', 5), (42, 4209, 'B04', 5), (42, 4210, 'B05', 5),
(42, 4211, 'C01', 5), (42, 4212, 'C02', 5), (42, 4213, 'C03', 5), (42, 4214, 'C04', 5), (42, 4215, 'C05', 5),
(42, 4216, 'D01', 5), (42, 4217, 'D02', 5), (42, 4218, 'D03', 5), (42, 4219, 'D04', 5), (42, 4220, 'D05', 5);

-- Room 43
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(43, 4301, 'A01', 5), (43, 4302, 'A02', 5), (43, 4303, 'A03', 5), (43, 4304, 'A04', 5), (43, 4305, 'A05', 5),
(43, 4306, 'B01', 5), (43, 4307, 'B02', 5), (43, 4308, 'B03', 5), (43, 4309, 'B04', 5), (43, 4310, 'B05', 5),
(43, 4311, 'C01', 5), (43, 4312, 'C02', 5), (43, 4313, 'C03', 5), (43, 4314, 'C04', 5), (43, 4315, 'C05', 5),
(43, 4316, 'D01', 5), (43, 4317, 'D02', 5), (43, 4318, 'D03', 5), (43, 4319, 'D04', 5), (43, 4320, 'D05', 5);

-- Room 51
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(51, 5101, 'A01', 5), (51, 5102, 'A02', 5), (51, 5103, 'A03', 5), (51, 5104, 'A04', 5), (51, 5105, 'A05', 5),
(51, 5106, 'B01', 5), (51, 5107, 'B02', 5), (51, 5108, 'B03', 5), (51, 5109, 'B04', 5), (51, 5110, 'B05', 5),
(51, 5111, 'C01', 5), (51, 5112, 'C02', 5), (51, 5113, 'C03', 5), (51, 5114, 'C04', 5), (51, 5115, 'C05', 5),
(51, 5116, 'D01', 5), (51, 5117, 'D02', 5), (51, 5118, 'D03', 5), (51, 5119, 'D04', 5), (51, 5120, 'D05', 5);

-- Room 52
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(52, 5201, 'A01', 5), (52, 5202, 'A02', 5), (52, 5203, 'A03', 5), (52, 5204, 'A04', 5), (52, 5205, 'A05', 5),
(52, 5206, 'B01', 5), (52, 5207, 'B02', 5), (52, 5208, 'B03', 5), (52, 5209, 'B04', 5), (52, 5210, 'B05', 5),
(52, 5211, 'C01', 5), (52, 5212, 'C02', 5), (52, 5213, 'C03', 5), (52, 5214, 'C04', 5), (52, 5215, 'C05', 5),
(52, 5216, 'D01', 5), (52, 5217, 'D02', 5), (52, 5218, 'D03', 5), (52, 5219, 'D04', 5), (52, 5220, 'D05', 5);

-- Room 53
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(53, 5301, 'A01', 5), (53, 5302, 'A02', 5), (53, 5303, 'A03', 5), (53, 5304, 'A04', 5), (53, 5305, 'A05', 5),
(53, 5306, 'B01', 5), (53, 5307, 'B02', 5), (53, 5308, 'B03', 5), (53, 5309, 'B04', 5), (53, 5310, 'B05', 5),
(53, 5311, 'C01', 5), (53, 5312, 'C02', 5), (53, 5313, 'C03', 5), (53, 5314, 'C04', 5), (53, 5315, 'C05', 5),
(53, 5316, 'D01', 5), (53, 5317, 'D02', 5), (53, 5318, 'D03', 5), (53, 5319, 'D04', 5), (53, 5320, 'D05', 5),

-- Room 61
(61, 6101, 'A01', 5), (61, 6102, 'A02', 5), (61, 6103, 'A03', 5), (61, 6104, 'A04', 5), (61, 6105, 'A05', 5),
(61, 6106, 'B01', 5), (61, 6107, 'B02', 5), (61, 6108, 'B03', 5), (61, 6109, 'B04', 5), (61, 6110, 'B05', 5),
(61, 6111, 'C01', 5), (61, 6112, 'C02', 5), (61, 6113, 'C03', 5), (61, 6114, 'C04', 5), (61, 6115, 'C05', 5),
(61, 6116, 'D01', 5), (61, 6117, 'D02', 5), (61, 6118, 'D03', 5), (61, 6119, 'D04', 5), (61, 6120, 'D05', 5),

-- Room 62
(62, 6201, 'A01', 5), (62, 6202, 'A02', 5), (62, 6203, 'A03', 5), (62, 6204, 'A04', 5), (62, 6205, 'A05', 5),
(62, 6206, 'B01', 5), (62, 6207, 'B02', 5), (62, 6208, 'B03', 5), (62, 6209, 'B04', 5), (62, 6210, 'B05', 5),
(62, 6211, 'C01', 5), (62, 6212, 'C02', 5), (62, 6213, 'C03', 5), (62, 6214, 'C04', 5), (62, 6215, 'C05', 5),
(62, 6216, 'D01', 5), (62, 6217, 'D02', 5), (62, 6218, 'D03', 5), (62, 6219, 'D04', 5), (62, 6220, 'D05', 5);

-- Room 63
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(63, 6301, 'A01', 5), (63, 6302, 'A02', 5), (63, 6303, 'A03', 5), (63, 6304, 'A04', 5), (63, 6305, 'A05', 5),
(63, 6306, 'B01', 5), (63, 6307, 'B02', 5), (63, 6308, 'B03', 5), (63, 6309, 'B04', 5), (63, 6310, 'B05', 5),
(63, 6311, 'C01', 5), (63, 6312, 'C02', 5), (63, 6313, 'C03', 5), (63, 6314, 'C04', 5), (63, 6315, 'C05', 5),
(63, 6316, 'D01', 5), (63, 6317, 'D02', 5), (63, 6318, 'D03', 5), (63, 6319, 'D04', 5), (63, 6320, 'D05', 5);

-- Room 71
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(71, 7101, 'A01', 5), (71, 7102, 'A02', 5), (71, 7103, 'A03', 5), (71, 7104, 'A04', 5), (71, 7105, 'A05', 5),
(71, 7106, 'B01', 5), (71, 7107, 'B02', 5), (71, 7108, 'B03', 5), (71, 7109, 'B04', 5), (71, 7110, 'B05', 5),
(71, 7111, 'C01', 5), (71, 7112, 'C02', 5), (71, 7113, 'C03', 5), (71, 7114, 'C04', 5), (71, 7115, 'C05', 5),
(71, 7116, 'D01', 5), (71, 7117, 'D02', 5), (71, 7118, 'D03', 5), (71, 7119, 'D04', 5), (71, 7120, 'D05', 5);

-- Room 72
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(72, 7201, 'A01', 5), (72, 7202, 'A02', 5), (72, 7203, 'A03', 5), (72, 7204, 'A04', 5), (72, 7205, 'A05', 5),
(72, 7206, 'B01', 5), (72, 7207, 'B02', 5), (72, 7208, 'B03', 5), (72, 7209, 'B04', 5), (72, 7210, 'B05', 5),
(72, 7211, 'C01', 5), (72, 7212, 'C02', 5), (72, 7213, 'C03', 5), (72, 7214, 'C04', 5), (72, 7215, 'C05', 5),
(72, 7216, 'D01', 5), (72, 7217, 'D02', 5), (72, 7218, 'D03', 5), (72, 7219, 'D04', 5), (72, 7220, 'D05', 5);

-- Room 73
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(73, 7301, 'A01', 5), (73, 7302, 'A02', 5), (73, 7303, 'A03', 5), (73, 7304, 'A04', 5), (73, 7305, 'A05', 5),
(73, 7306, 'B01', 5), (73, 7307, 'B02', 5), (73, 7308, 'B03', 5), (73, 7309, 'B04', 5), (73, 7310, 'B05', 5),
(73, 7311, 'C01', 5), (73, 7312, 'C02', 5), (73, 7313, 'C03', 5), (73, 7314, 'C04', 5), (73, 7315, 'C05', 5),
(73, 7316, 'D01', 5), (73, 7317, 'D02', 5), (73, 7318, 'D03', 5), (73, 7319, 'D04', 5), (73, 7320, 'D05', 5);

-- Room 81
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(81, 8101, 'A01', 5), (81, 8102, 'A02', 5), (81, 8103, 'A03', 5), (81, 8104, 'A04', 5), (81, 8105, 'A05', 5),
(81, 8106, 'B01', 5), (81, 8107, 'B02', 5), (81, 8108, 'B03', 5), (81, 8109, 'B04', 5), (81, 8110, 'B05', 5),
(81, 8111, 'C01', 5), (81, 8112, 'C02', 5), (81, 8113, 'C03', 5), (81, 8114, 'C04', 5), (81, 8115, 'C05', 5),
(81, 8116, 'D01', 5), (81, 8117, 'D02', 5), (81, 8118, 'D03', 5), (81, 8119, 'D04', 5), (81, 8120, 'D05', 5);

-- Room 82
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(82, 8201, 'A01', 5), (82, 8202, 'A02', 5), (82, 8203, 'A03', 5), (82, 8204, 'A04', 5), (82, 8205, 'A05', 5),
(82, 8206, 'B01', 5), (82, 8207, 'B02', 5), (82, 8208, 'B03', 5), (82, 8209, 'B04', 5), (82, 8210, 'B05', 5),
(82, 8211, 'C01', 5), (82, 8212, 'C02', 5), (82, 8213, 'C03', 5), (82, 8214, 'C04', 5), (82, 8215, 'C05', 5),
(82, 8216, 'D01', 5), (82, 8217, 'D02', 5), (82, 8218, 'D03', 5), (82, 8219, 'D04', 5), (82, 8220, 'D05', 5);

-- Room 83
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(83, 8301, 'A01', 5), (83, 8302, 'A02', 5), (83, 8303, 'A03', 5), (83, 8304, 'A04', 5), (83, 8305, 'A05', 5),
(83, 8306, 'B01', 5), (83, 8307, 'B02', 5), (83, 8308, 'B03', 5), (83, 8309, 'B04', 5), (83, 8310, 'B05', 5),
(83, 8311, 'C01', 5), (83, 8312, 'C02', 5), (83, 8313, 'C03', 5), (83, 8314, 'C04', 5), (83, 8315, 'C05', 5),
(83, 8316, 'D01', 5), (83, 8317, 'D02', 5), (83, 8318, 'D03', 5), (83, 8319, 'D04', 5), (83, 8320, 'D05', 5);

-- Room 91
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(91, 9101, 'A01', 5), (91, 9102, 'A02', 5), (91, 9103, 'A03', 5), (91, 9104, 'A04', 5), (91, 9105, 'A05', 5),
(91, 9106, 'B01', 5), (91, 9107, 'B02', 5), (91, 9108, 'B03', 5), (91, 9109, 'B04', 5), (91, 9110, 'B05', 5),
(91, 9111, 'C01', 5), (91, 9112, 'C02', 5), (91, 9113, 'C03', 5), (91, 9114, 'C04', 5), (91, 9115, 'C05', 5),
(91, 9116, 'D01', 5), (91, 9117, 'D02', 5), (91, 9118, 'D03', 5), (91, 9119, 'D04', 5), (91, 9120, 'D05', 5);

-- Room 92
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(92, 9201, 'A01', 5), (92, 9202, 'A02', 5), (92, 9203, 'A03', 5), (92, 9204, 'A04', 5), (92, 9205, 'A05', 5),
(92, 9206, 'B01', 5), (92, 9207, 'B02', 5), (92, 9208, 'B03', 5), (92, 9209, 'B04', 5), (92, 9210, 'B05', 5),
(92, 9211, 'C01', 5), (92, 9212, 'C02', 5), (92, 9213, 'C03', 5), (92, 9214, 'C04', 5), (92, 9215, 'C05', 5),
(92, 9216, 'D01', 5), (92, 9217, 'D02', 5), (92, 9218, 'D03', 5), (92, 9219, 'D04', 5), (92, 9220, 'D05', 5);

-- Room 93
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(93, 9301, 'A01', 5), (93, 9302, 'A02', 5), (93, 9303, 'A03', 5), (93, 9304, 'A04', 5), (93, 9305, 'A05', 5),
(93, 9306, 'B01', 5), (93, 9307, 'B02', 5), (93, 9308, 'B03', 5), (93, 9309, 'B04', 5), (93, 9310, 'B05', 5),
(93, 9311, 'C01', 5), (93, 9312, 'C02', 5), (93, 9313, 'C03', 5), (93, 9314, 'C04', 5), (93, 9315, 'C05', 5),
(93, 9316, 'D01', 5), (93, 9317, 'D02', 5), (93, 9318, 'D03', 5), (93, 9319, 'D04', 5), (93, 9320, 'D05', 5);

-- Room 11
INSERT INTO seats(room_id, seat_id, seat_name, run_time_id) VALUES
(11, 1101, 'A01', 6), (11, 1102, 'A02', 6), (11, 1103, 'A03', 6), (11, 1104, 'A04', 6), (11, 1105, 'A05', 6),
(11, 1106, 'B01', 6), (11, 1107, 'B02', 6), (11, 1108, 'B03', 6), (11, 1109, 'B04', 6), (11, 1110, 'B05', 6),
(11, 1111, 'C01', 6), (11, 1112, 'C02', 6), (11, 1113, 'C03', 6), (11, 1114, 'C04', 6), (11, 1115, 'C05', 6),
(11, 1116, 'D01', 6), (11, 1117, 'D02', 6), (11, 1118, 'D03', 6), (11, 1119, 'D04', 6), (11, 1120, 'D05', 6),

-- Room 12
(12, 1201, 'A01', 6), (12, 1202, 'A02', 6), (12, 1203, 'A03', 6), (12, 1204, 'A04', 6), (12, 1205, 'A05', 6),
(12, 1206, 'B01', 6), (12, 1207, 'B02', 6), (12, 1208, 'B03', 6), (12, 1209, 'B04', 6), (12, 1210, 'B05', 6),
(12, 1211, 'C01', 6), (12, 1212, 'C02', 6), (12, 1213, 'C03', 6), (12, 1214, 'C04', 6), (12, 1215, 'C05', 6),
(12, 1216, 'D01', 6), (12, 1217, 'D02', 6), (12, 1218, 'D03', 6), (12, 1219, 'D04', 6), (12, 1220, 'D05', 6),

-- Room 13
(13, 1301, 'A01', 6), (13, 1302, 'A02', 6), (13, 1303, 'A03', 6), (13, 1304, 'A04', 6), (13, 1305, 'A05', 6),
(13, 1306, 'B01', 6), (13, 1307, 'B02', 6), (13, 1308, 'B03', 6), (13, 1309, 'B04', 6), (13, 1310, 'B05', 6),
(13, 1311, 'C01', 6), (13, 1312, 'C02', 6), (13, 1313, 'C03', 6), (13, 1314, 'C04', 6), (13, 1315, 'C05', 6),
(13, 1316, 'D01', 6), (13, 1317, 'D02', 6), (13, 1318, 'D03', 6), (13, 1319, 'D04', 6), (13, 1320, 'D05', 6),

-- Room 21
(21, 2101, 'A01', 6), (21, 2102, 'A02', 6), (21, 2103, 'A03', 6), (21, 2104, 'A04', 6), (21, 2105, 'A05', 6),
(21, 2106, 'B01', 6), (21, 2107, 'B02', 6), (21, 2108, 'B03', 6), (21, 2109, 'B04', 6), (21, 2110, 'B05', 6),
(21, 2111, 'C01', 6), (21, 2112, 'C02', 6), (21, 2113, 'C03', 6), (21, 2114, 'C04', 6), (21, 2115, 'C05', 6),
(21, 2116, 'D01', 6), (21, 2117, 'D02', 6), (21, 2118, 'D03', 6), (21, 2119, 'D04', 6), (21, 2120, 'D05', 6),

-- Room 22
(22, 2201, 'A01', 6), (22, 2202, 'A02', 6), (22, 2203, 'A03', 6), (22, 2204, 'A04', 6), (22, 2205, 'A05', 6),
(22, 2206, 'B01', 6), (22, 2207, 'B02', 6), (22, 2208, 'B03', 6), (22, 2209, 'B04', 6), (22, 2210, 'B05', 6),
(22, 2211, 'C01', 6), (22, 2212, 'C02', 6), (22, 2213, 'C03', 6), (22, 2214, 'C04', 6), (22, 2215, 'C05', 6),
(22, 2216, 'D01', 6), (22, 2217, 'D02', 6), (22, 2218, 'D03', 6), (22, 2219, 'D04', 6), (22, 2220, 'D05', 6),

-- Room 23
(23, 2301, 'A01', 6), (23, 2302, 'A02', 6), (23, 2303, 'A03', 6), (23, 2304, 'A04', 6), (23, 2305, 'A05', 6),
(23, 2306, 'B01', 6), (23, 2307, 'B02', 6), (23, 2308, 'B03', 6), (23, 2309, 'B04', 6), (23, 2310, 'B05', 6),
(23, 2311, 'C01', 6), (23, 2312, 'C02', 6), (23, 2313, 'C03', 6), (23, 2314, 'C04', 6), (23, 2315, 'C05', 6),
(23, 2316, 'D01', 6), (23, 2317, 'D02', 6), (23, 2318, 'D03', 6), (23, 2319, 'D04', 6), (23, 2320, 'D05', 6),

-- Room 31
(31, 3101, 'A01', 6), (31, 3102, 'A02', 6), (31, 3103, 'A03', 6), (31, 3104, 'A04', 6), (31, 3105, 'A05', 6),
(31, 3106, 'B01', 6), (31, 3107, 'B02', 6), (31, 3108, 'B03', 6), (31, 3109, 'B04', 6), (31, 3110, 'B05', 6),
(31, 3111, 'C01', 6), (31, 3112, 'C02', 6), (31, 3113, 'C03', 6), (31, 3114, 'C04', 6), (31, 3115, 'C05', 6),
(31, 3116, 'D01', 6), (31, 3117, 'D02', 6), (31, 3118, 'D03', 6), (31, 3119, 'D04', 6), (31, 3120, 'D05', 6),

-- Room 32
(32, 3201, 'A01', 6), (32, 3202, 'A02', 6), (32, 3203, 'A03', 6), (32, 3204, 'A04', 6), (32, 3205, 'A05', 6),
(32, 3206, 'B01', 6), (32, 3207, 'B02', 6), (32, 3208, 'B03', 6), (32, 3209, 'B04', 6), (32, 3210, 'B05', 6),
(32, 3211, 'C01', 6), (32, 3212, 'C02', 6), (32, 3213, 'C03', 6), (32, 3214, 'C04', 6), (32, 3215, 'C05', 6),
(32, 3216, 'D01', 6), (32, 3217, 'D02', 6), (32, 3218, 'D03', 6), (32, 3219, 'D04', 6), (32, 3220, 'D05', 6),

-- Room 33
(33, 3301, 'A01', 6), (33, 3302, 'A02', 6), (33, 3303, 'A03', 6), (33, 3304, 'A04', 6), (33, 3305, 'A05', 6),
(33, 3306, 'B01', 6), (33, 3307, 'B02', 6), (33, 3308, 'B03', 6), (33, 3309, 'B04', 6), (33, 3310, 'B05', 6),
(33, 3311, 'C01', 6), (33, 3312, 'C02', 6), (33, 3313, 'C03', 6), (33, 3314, 'C04', 6), (33, 3315, 'C05', 6),
(33, 3316, 'D01', 6), (33, 3317, 'D02', 6), (33, 3318, 'D03', 6), (33, 3319, 'D04', 6), (33, 3320, 'D05', 6),

-- Room 41
(41, 4101, 'A01', 6), (41, 4102, 'A02', 6), (41, 4103, 'A03', 6), (41, 4104, 'A04', 6), (41, 4105, 'A05', 6),
(41, 4106, 'B01', 6), (41, 4107, 'B02', 6), (41, 4108, 'B03', 6), (41, 4109, 'B04', 6), (41, 4110, 'B05', 6),
(41, 4111, 'C01', 6), (41, 4112, 'C02', 6), (41, 4113, 'C03', 6), (41, 4114, 'C04', 6), (41, 4115, 'C05', 6),
(41, 4116, 'D01', 6), (41, 4117, 'D02', 6), (41, 4118, 'D03', 6), (41, 4119, 'D04', 6), (41, 4120, 'D05', 6),

-- Room 42
(42, 4201, 'A01', 6), (42, 4202, 'A02', 6), (42, 4203, 'A03', 6), (42, 4204, 'A04', 6), (42, 4205, 'A05', 6),
(42, 4206, 'B01', 6), (42, 4207, 'B02', 6), (42, 4208, 'B03', 6), (42, 4209, 'B04', 6), (42, 4210, 'B05', 6),
(42, 4211, 'C01', 6), (42, 4212, 'C02', 6), (42, 4213, 'C03', 6), (42, 4214, 'C04', 6), (42, 4215, 'C05', 6),
(42, 4216, 'D01', 6), (42, 4217, 'D02', 6), (42, 4218, 'D03', 6), (42, 4219, 'D04', 6), (42, 4220, 'D05', 6),

-- Room 43
(43, 4301, 'A01', 6), (43, 4302, 'A02', 6), (43, 4303, 'A03', 6), (43, 4304, 'A04', 6), (43, 4305, 'A05', 6),
(43, 4306, 'B01', 6), (43, 4307, 'B02', 6), (43, 4308, 'B03', 6), (43, 4309, 'B04', 6), (43, 4310, 'B05', 6),
(43, 4311, 'C01', 6), (43, 4312, 'C02', 6), (43, 4313, 'C03', 6), (43, 4314, 'C04', 6), (43, 4315, 'C05', 6),
(43, 4316, 'D01', 6), (43, 4317, 'D02', 6), (43, 4318, 'D03', 6), (43, 4319, 'D04', 6), (43, 4320, 'D05', 6),

-- Room 51
(51, 5101, 'A01', 6), (51, 5102, 'A02', 6), (51, 5103, 'A03', 6), (51, 5104, 'A04', 6), (51, 5105, 'A05', 6),
(51, 5106, 'B01', 6), (51, 5107, 'B02', 6), (51, 5108, 'B03', 6), (51, 5109, 'B04', 6), (51, 5110, 'B05', 6),
(51, 5111, 'C01', 6), (51, 5112, 'C02', 6), (51, 5113, 'C03', 6), (51, 5114, 'C04', 6), (51, 5115, 'C05', 6),
(51, 5116, 'D01', 6), (51, 5117, 'D02', 6), (51, 5118, 'D03', 6), (51, 5119, 'D04', 6), (51, 5120, 'D05', 6),

-- Room 52
(52, 5201, 'A01', 6), (52, 5202, 'A02', 6), (52, 5203, 'A03', 6), (52, 5204, 'A04', 6), (52, 5205, 'A05', 6),
(52, 5206, 'B01', 6), (52, 5207, 'B02', 6), (52, 5208, 'B03', 6), (52, 5209, 'B04', 6), (52, 5210, 'B05', 6),
(52, 5211, 'C01', 6), (52, 5212, 'C02', 6), (52, 5213, 'C03', 6), (52, 5214, 'C04', 6), (52, 5215, 'C05', 6),
(52, 5216, 'D01', 6), (52, 5217, 'D02', 6), (52, 5218, 'D03', 6), (52, 5219, 'D04', 6), (52, 5220, 'D05', 6),

-- Room 53
(53, 5301, 'A01', 6), (53, 5302, 'A02', 6), (53, 5303, 'A03', 6), (53, 5304, 'A04', 6), (53, 5305, 'A05', 6),
(53, 5306, 'B01', 6), (53, 5307, 'B02', 6), (53, 5308, 'B03', 6), (53, 5309, 'B04', 6), (53, 5310, 'B05', 6),
(53, 5311, 'C01', 6), (53, 5312, 'C02', 6), (53, 5313, 'C03', 6), (53, 5314, 'C04', 6), (53, 5315, 'C05', 6),
(53, 5316, 'D01', 6), (53, 5317, 'D02', 6), (53, 5318, 'D03', 6), (53, 5319, 'D04', 6), (53, 5320, 'D05', 6),

-- Room 61
(61, 6101, 'A01', 6), (61, 6102, 'A02', 6), (61, 6103, 'A03', 6), (61, 6104, 'A04', 6), (61, 6105, 'A05', 6),
(61, 6106, 'B01', 6), (61, 6107, 'B02', 6), (61, 6108, 'B03', 6), (61, 6109, 'B04', 6), (61, 6110, 'B05', 6),
(61, 6111, 'C01', 6), (61, 6112, 'C02', 6), (61, 6113, 'C03', 6), (61, 6114, 'C04', 6), (61, 6115, 'C05', 6),
(61, 6116, 'D01', 6), (61, 6117, 'D02', 6), (61, 6118, 'D03', 6), (61, 6119, 'D04', 6), (61, 6120, 'D05', 6),

-- Room 62
(62, 6201, 'A01', 6), (62, 6202, 'A02', 6), (62, 6203, 'A03', 6), (62, 6204, 'A04', 6), (62, 6205, 'A05', 6),
(62, 6206, 'B01', 6), (62, 6207, 'B02', 6), (62, 6208, 'B03', 6), (62, 6209, 'B04', 6), (62, 6210, 'B05', 6),
(62, 6211, 'C01', 6), (62, 6212, 'C02', 6), (62, 6213, 'C03', 6), (62, 6214, 'C04', 6), (62, 6215, 'C05', 6),
(62, 6216, 'D01', 6), (62, 6217, 'D02', 6), (62, 6218, 'D03', 6), (62, 6219, 'D04', 6), (62, 6220, 'D05', 6),

-- Room 63
(63, 6301, 'A01', 6), (63, 6302, 'A02', 6), (63, 6303, 'A03', 6), (63, 6304, 'A04', 6), (63, 6305, 'A05', 6),
(63, 6306, 'B01', 6), (63, 6307, 'B02', 6), (63, 6308, 'B03', 6), (63, 6309, 'B04', 6), (63, 6310, 'B05', 6),
(63, 6311, 'C01', 6), (63, 6312, 'C02', 6), (63, 6313, 'C03', 6), (63, 6314, 'C04', 6), (63, 6315, 'C05', 6),
(63, 6316, 'D01', 6), (63, 6317, 'D02', 6), (63, 6318, 'D03', 6), (63, 6319, 'D04', 6), (63, 6320, 'D05', 6),

-- Room 71
(71, 7101, 'A01', 6), (71, 7102, 'A02', 6), (71, 7103, 'A03', 6), (71, 7104, 'A04', 6), (71, 7105, 'A05', 6),
(71, 7106, 'B01', 6), (71, 7107, 'B02', 6), (71, 7108, 'B03', 6), (71, 7109, 'B04', 6), (71, 7110, 'B05', 6),
(71, 7111, 'C01', 6), (71, 7112, 'C02', 6), (71, 7113, 'C03', 6), (71, 7114, 'C04', 6), (71, 7115, 'C05', 6),
(71, 7116, 'D01', 6), (71, 7117, 'D02', 6), (71, 7118, 'D03', 6), (71, 7119, 'D04', 6), (71, 7120, 'D05', 6),

-- Room 72
(72, 7201, 'A01', 6), (72, 7202, 'A02', 6), (72, 7203, 'A03', 6), (72, 7204, 'A04', 6), (72, 7205, 'A05', 6),
(72, 7206, 'B01', 6), (72, 7207, 'B02', 6), (72, 7208, 'B03', 6), (72, 7209, 'B04', 6), (72, 7210, 'B05', 6),
(72, 7211, 'C01', 6), (72, 7212, 'C02', 6), (72, 7213, 'C03', 6), (72, 7214, 'C04', 6), (72, 7215, 'C05', 6),
(72, 7216, 'D01', 6), (72, 7217, 'D02', 6), (72, 7218, 'D03', 6), (72, 7219, 'D04', 6), (72, 7220, 'D05', 6),

-- Room 73
(73, 7301, 'A01', 6), (73, 7302, 'A02', 6), (73, 7303, 'A03', 6), (73, 7304, 'A04', 6), (73, 7305, 'A05', 6),
(73, 7306, 'B01', 6), (73, 7307, 'B02', 6), (73, 7308, 'B03', 6), (73, 7309, 'B04', 6), (73, 7310, 'B05', 6),
(73, 7311, 'C01', 6), (73, 7312, 'C02', 6), (73, 7313, 'C03', 6), (73, 7314, 'C04', 6), (73, 7315, 'C05', 6),
(73, 7316, 'D01', 6), (73, 7317, 'D02', 6), (73, 7318, 'D03', 6), (73, 7319, 'D04', 6), (73, 7320, 'D05', 6),

-- Room 81
(81, 8101, 'A01', 6), (81, 8102, 'A02', 6), (81, 8103, 'A03', 6), (81, 8104, 'A04', 6), (81, 8105, 'A05', 6),
(81, 8106, 'B01', 6), (81, 8107, 'B02', 6), (81, 8108, 'B03', 6), (81, 8109, 'B04', 6), (81, 8110, 'B05', 6),
(81, 8111, 'C01', 6), (81, 8112, 'C02', 6), (81, 8113, 'C03', 6), (81, 8114, 'C04', 6), (81, 8115, 'C05', 6),
(81, 8116, 'D01', 6), (81, 8117, 'D02', 6), (81, 8118, 'D03', 6), (81, 8119, 'D04', 6), (81, 8120, 'D05', 6),

-- Room 82
(82, 8201, 'A01', 6), (82, 8202, 'A02', 6), (82, 8203, 'A03', 6), (82, 8204, 'A04', 6), (82, 8205, 'A05', 6),
(82, 8206, 'B01', 6), (82, 8207, 'B02', 6), (82, 8208, 'B03', 6), (82, 8209, 'B04', 6), (82, 8210, 'B05', 6),
(82, 8211, 'C01', 6), (82, 8212, 'C02', 6), (82, 8213, 'C03', 6), (82, 8214, 'C04', 6), (82, 8215, 'C05', 6),
(82, 8216, 'D01', 6), (82, 8217, 'D02', 6), (82, 8218, 'D03', 6), (82, 8219, 'D04', 6), (82, 8220, 'D05', 6),

-- Room 83
(83, 8301, 'A01', 6), (83, 8302, 'A02', 6), (83, 8303, 'A03', 6), (83, 8304, 'A04', 6), (83, 8305, 'A05', 6),
(83, 8306, 'B01', 6), (83, 8307, 'B02', 6), (83, 8308, 'B03', 6), (83, 8309, 'B04', 6), (83, 8310, 'B05', 6),
(83, 8311, 'C01', 6), (83, 8312, 'C02', 6), (83, 8313, 'C03', 6), (83, 8314, 'C04', 6), (83, 8315, 'C05', 6),
(83, 8316, 'D01', 6), (83, 8317, 'D02', 6), (83, 8318, 'D03', 6), (83, 8319, 'D04', 6), (83, 8320, 'D05', 6),

-- Room 91
(91, 9101, 'A01', 6), (91, 9102, 'A02', 6), (91, 9103, 'A03', 6), (91, 9104, 'A04', 6), (91, 9105, 'A05', 6),
(91, 9106, 'B01', 6), (91, 9107, 'B02', 6), (91, 9108, 'B03', 6), (91, 9109, 'B04', 6), (91, 9110, 'B05', 6),
(91, 9111, 'C01', 6), (91, 9112, 'C02', 6), (91, 9113, 'C03', 6), (91, 9114, 'C04', 6), (91, 9115, 'C05', 6),
(91, 9116, 'D01', 6), (91, 9117, 'D02', 6), (91, 9118, 'D03', 6), (91, 9119, 'D04', 6), (91, 9120, 'D05', 6),

-- Room 92
(92, 9201, 'A01', 6), (92, 9202, 'A02', 6), (92, 9203, 'A03', 6), (92, 9204, 'A04', 6), (92, 9205, 'A05', 6),
(92, 9206, 'B01', 6), (92, 9207, 'B02', 6), (92, 9208, 'B03', 6), (92, 9209, 'B04', 6), (92, 9210, 'B05', 6),
(92, 9211, 'C01', 6), (92, 9212, 'C02', 6), (92, 9213, 'C03', 6), (92, 9214, 'C04', 6), (92, 9215, 'C05', 6),
(92, 9216, 'D01', 6), (92, 9217, 'D02', 6), (92, 9218, 'D03', 6), (92, 9219, 'D04', 6), (92, 9220, 'D05', 6),

-- Room 93
(93, 9301, 'A01', 6), (93, 9302, 'A02', 6), (93, 9303, 'A03', 6), (93, 9304, 'A04', 6), (93, 9305, 'A05', 6),
(93, 9306, 'B01', 6), (93, 9307, 'B02', 6), (93, 9308, 'B03', 6), (93, 9309, 'B04', 6), (93, 9310, 'B05', 6),
(93, 9311, 'C01', 6), (93, 9312, 'C02', 6), (93, 9313, 'C03', 6), (93, 9314, 'C04', 6), (93, 9315, 'C05', 6),
(93, 9316, 'D01', 6), (93, 9317, 'D02', 6), (93, 9318, 'D03', 6), (93, 9319, 'D04', 6), (93, 9320, 'D05', 6);



-- Ví dụ tạo lịch chiếu cho 47 phim
-- Đây là một ví dụ cơ bản, bạn có thể điều chỉnh thời gian, rạp, ngày chiếu cho phù hợp

-- Tạo lịch chiếu cho phim có movie_id từ 1 đến 47
-- Ví dụ cho phim có movie_id = 1
INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (1, 1, 11, '2024-07-15', 1),
    (2, 1, 12, '2024-07-15', 2),
    (3, 1, 13, '2024-07-15', 3),
    (4, 1, 11, '2024-07-16', 2),
    (5, 1, 12, '2024-07-16', 3),
    -- Thêm các lịch chiếu khác cho phim có movie_id = 1

    -- Lịch chiếu cho phim có movie_id = 2
    (6, 2, 21, '2024-07-15', 1),
    (7, 2, 22, '2024-07-15', 2),
    (8, 2, 23, '2024-07-15', 3),
    (9, 2, 21, '2024-07-16', 2),
    (10, 2, 22, '2024-07-16', 3),
    -- Thêm các lịch chiếu khác cho phim có movie_id = 2

    -- Tiếp tục cho tất cả các phim khác...

    -- Ví dụ cho phim có movie_id = 47
    (91, 47, 91, '2024-07-15', 1),
    (92, 47, 92, '2024-07-15', 2),
    (93, 47, 93, '2024-07-15', 3),
    (94, 47, 91, '2024-07-16', 2),
    (95, 47, 92, '2024-07-16', 3);
    -- Thêm các lịch chiếu khác cho phim có movie_id = 47

-- Lưu ý: Đây chỉ là một phần của quá trình tạo lịch chiếu. Bạn cần phải điều chỉnh cho phù hợp với số lượng rạp và thời gian chiếu thực tế của dự án của bạn.

-- Tiếp tục thêm lịch chiếu cho các phim còn lại
-- Đây là một ví dụ đại diện, bạn có thể thay đổi các giá trị để phù hợp với dự án của bạn

-- Ví dụ cho phim có movie_id = 3
INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (11, 3, 31, '2024-07-15', 1),
    (12, 3, 32, '2024-07-15', 2),
    (13, 3, 33, '2024-07-15', 3),
    (14, 3, 31, '2024-07-16', 2),
    (15, 3, 32, '2024-07-16', 3)
    -- Thêm các lịch chiếu khác cho phim có movie_id = 3

-- Ví dụ cho phim có movie_id = 4
INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (16, 4, 41, '2024-07-15', 1),
    (17, 4, 42, '2024-07-15', 2),
    (18, 4, 43, '2024-07-15', 3),
    (19, 4, 41, '2024-07-16', 2),
    (20, 4, 42, '2024-07-16', 3)
    -- Thêm các lịch chiếu khác cho phim có movie_id = 4

-- Tiếp tục cho các phim còn lại...

-- Ví dụ cho phim có movie_id = 47
INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (31, 47, 91, '2024-07-15', 1),
    (32, 47, 92, '2024-07-15', 2),
    (33, 47, 93, '2024-07-15', 3),
    (34, 47, 91, '2024-07-16', 6),
    (35, 47, 92, '2024-07-16', 3);
    -- Thêm các lịch chiếu khác cho phim có movie_id = 47

-- Lưu ý: Bạn cần phải thay đổi các giá trị như `room_id`, `schedule_date`, `run_time_id` để phù hợp với thực tế số lượng rạp và lịch chiếu của dự án của bạn.

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (96, 25, 91, '2024-07-15', 1),
    (97, 26, 92, '2024-07-15', 2),
    (98, 27, 93, '2024-07-15', 3),
    (99, 28, 91, '2024-07-16', 2),
    (100, 29, 92, '2024-07-16', 3),
    (101, 30, 93, '2024-07-17', 1),
    (102, 31, 91, '2024-07-17', 2),
    (103, 32, 92, '2024-07-17', 3),
    (104, 33, 93, '2024-07-18', 1),
    (105, 34, 91, '2024-07-18', 2),
    (106, 35, 92, '2024-07-18', 3);

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (107, 35, 91, '2024-07-19', 4),
    (108, 36, 92, '2024-07-19', 5),
    (109, 37, 93, '2024-07-19', 6),
    (110, 38, 91, '2024-07-20', 5),
    (111, 39, 92, '2024-07-20', 6),
    (112, 40, 93, '2024-07-21', 4),
    (113, 41, 91, '2024-07-21', 5),
    (114, 42, 92, '2024-07-21', 6),
    (115, 43, 93, '2024-07-22', 4),
    (116, 44, 91, '2024-07-22', 5),
    (117, 45, 92, '2024-07-22', 6),
    (118, 46, 93, '2024-07-23', 4);


INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (119, 20, 91, '2024-07-24', 4),
    (120, 21, 92, '2024-07-24', 5),
    (121, 22, 93, '2024-07-24', 6),
    (122, 23, 91, '2024-07-25', 5),
    (123, 24, 92, '2024-07-25', 6),
    (124, 25, 93, '2024-07-26', 4);
INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (125, 5, 91, '2024-07-27', 4),
    (126, 6, 92, '2024-07-27', 5),
    (127, 7, 93, '2024-07-27', 6),
    (128, 8, 91, '2024-07-28', 5),
    (129, 9, 92, '2024-07-28', 6),
    (130, 10, 93, '2024-07-29', 4),
    (131, 11, 91, '2024-07-29', 5),
    (132, 12, 92, '2024-07-29', 6),
    (133, 13, 93, '2024-07-30', 4),
    (134, 14, 91, '2024-07-30', 5),
    (135, 15, 92, '2024-07-30', 6);

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (136, 5, 93, '2024-07-31', 3),
    (137, 6, 91, '2024-07-31', 4),
    (138, 7, 92, '2024-07-31', 5),
    (139, 8, 93, '2024-08-01', 4),
    (140, 9, 91, '2024-08-01', 5),
    (141, 10, 92, '2024-08-02', 3),
    (142, 11, 93, '2024-08-02', 4),
    (143, 12, 91, '2024-08-02', 5),
    (144, 13, 92, '2024-08-03', 3),
    (145, 14, 93, '2024-08-03', 4);

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (146, 47, 72, '2024-08-04', 1),
    (147, 47, 61, '2024-08-04', 2),
    (148, 47, 52, '2024-08-04', 3),
    (149, 47, 33, '2024-08-05', 2),
    (150, 47, 71, '2024-08-05', 3);

-- Thêm các lịch chiếu khác cho phim có movie_id = 47

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (151, 25, 43, '2024-08-04', 1),
    (152, 26, 61, '2024-08-04', 2),
    (153, 27, 52, '2024-08-04', 3),
    (154, 28, 72, '2024-08-05', 2),
    (155, 29, 31, '2024-08-05', 3),
    (156, 30, 63, '2024-08-06', 1),
    (157, 31, 41, '2024-08-06', 2),
    (158, 32, 52, '2024-08-06', 3),
    (159, 33, 42, '2024-08-07', 1),
    (160, 34, 73, '2024-08-07', 2),
    (161, 35, 62, '2024-08-07', 3);

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (162, 35, 71, '2024-08-08', 4),
    (163, 36, 32, '2024-08-08', 5),
    (164, 37, 62, '2024-08-08', 6),
    (165, 38, 43, '2024-08-09', 5),
    (166, 39, 31, '2024-08-09', 6),
    (167, 40, 73, '2024-08-10', 4),
    (168, 41, 61, '2024-08-10', 5),
    (169, 42, 72, '2024-08-10', 6),
    (170, 43, 51, '2024-08-11', 4),
    (171, 44, 52, '2024-08-11', 5),
    (172, 45, 41, '2024-08-11', 6),
    (173, 46, 72, '2024-08-12', 4);

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (174, 20, 42, '2024-08-12', 4),
    (175, 21, 31, '2024-08-12', 5),
    (176, 22, 63, '2024-08-12', 6),
    (177, 23, 32, '2024-08-13', 5),
    (178, 24, 53, '2024-08-13', 6),
    (179, 25, 61, '2024-08-14', 4);

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (180, 5, 71, '2024-08-14', 4),
    (181, 6, 62, '2024-08-14', 5),
    (182, 7, 33, '2024-08-15', 6),
    (183, 8, 42, '2024-08-15', 5),
    (184, 9, 53, '2024-08-15', 6),
    (185, 10, 31, '2024-08-16', 4),
    (186, 11, 72, '2024-08-16', 5),
    (187, 12, 53, '2024-08-16', 6),
    (188, 13, 41, '2024-08-17', 4),
    (189, 14, 52, '2024-08-17', 5),
    (190, 15, 43, '2024-08-17', 6);

INSERT INTO schedule (schedule_id, movie_id, room_id, schedule_date, run_time_id)
VALUES 
    (191, 5, 41, '2024-08-18', 3),
    (192, 6, 62, '2024-08-18', 4),
    (193, 7, 33, '2024-08-18', 5),
    (194, 8, 63, '2024-08-19', 4),
    (195, 9, 52, '2024-08-19', 5),
    (196, 10, 71, '2024-08-20', 3),
    (197, 11, 42, '2024-08-20', 4),
    (198, 12, 61, '2024-08-20', 5),
    (199, 13, 73, '2024-08-21', 3),
    (200, 14, 52, '2024-08-21', 4);
