CREATE TABLE assets (
  id serial PRIMARY KEY,
  url text UNIQUE NOT NULL,
  uploaded_at timestamp NOT NULL DEFAULT NOW(),
  file_size varchar(255) NOT NULL,
  file_type varchar(50) NOT NULL,
  cognitive_text text
);

INSERT INTO assets (url, file_size, file_type)
VALUES ('https://jingxie16.files.wordpress.com/2015/08/international-students-program-flyer-berkeley-en1.jpg', '3.4MB', 'JPEG');

INSERT INTO assets (url, file_size, file_type)
VALUES 
('https://jingxie16.files.wordpress.com/2015/08/international-students-program_flyer_ca.jpg', '3.8MB', 'JPEG'),
('https://jingxie16.files.wordpress.com/2015/08/2014_kcon_pod_mechanical_071014.jpg', '2.2MB', 'JPEG'),
('http://www.ardoinadvertising.com/wp-content/uploads/2018/09/VerizonFlyer2-front-back.jpg', '484KB', 'JPEG');
