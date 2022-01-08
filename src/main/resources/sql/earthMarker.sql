drop table country_code;
create table country_code (
    alpha_two_code varchar2(2) primary key,
    country_name varchar2(56)
);

insert into country_code values ('AD', 'Andorra');
insert into country_code values ('AE', 'United Arab Emirates');
insert into country_code values ('AF', 'Afghanistan');
insert into country_code values ('AG', 'Antigua and Barbuda');
insert into country_code values ('AI', 'Anguilla');
insert into country_code values ('AL', 'Albania');
insert into country_code values ('AM', 'Armenia');
insert into country_code values ('AO', 'Angola');
insert into country_code values ('AQ', 'Antarctica');
insert into country_code values ('AR', 'Argentina');
insert into country_code values ('AR', 'American Samoa');
insert into country_code values ('AT', 'Austria');
insert into country_code values ('AU', 'Australia');
insert into country_code values ('AW', 'Aruba');
insert into country_code values ('AX', 'Åland Islands');
insert into country_code values ('AZ', 'Azerbaijan');
insert into country_code values ('BA', 'Bosnia and Herzegovina');
insert into country_code values ('BB', 'Barbados');
insert into country_code values ('BD', 'Bangladesh');
insert into country_code values ('BE', 'Belgium');
insert into country_code values ('BF', 'Burkina Faso');
insert into country_code values ('BG', 'Bulgaria');
insert into country_code values ('BH', 'Bahrain');
insert into country_code values ('BI', 'Burundi');
insert into country_code values ('BJ', 'Benin');
insert into country_code values ('BL', 'Saint Barthélemy');
insert into country_code values ('BM', 'Bermuda');
insert into country_code values ('BN', 'Brunei Darussalam');
insert into country_code values ('BO', 'Bolivia (Plurinational State of)');
insert into country_code values ('BQ', 'Bonaire, Sint Eustatius and Saba');
insert into country_code values ('BR', 'Brazil');
insert into country_code values ('BS', 'Bahamas');
insert into country_code values ('BT', 'Bhutan');
insert into country_code values ('BV', 'Bouvet Island');
insert into country_code values ('BW', 'Botswana');
insert into country_code values ('BY', 'Belarus');
insert into country_code values ('BZ', 'Belize');
insert into country_code values ('B', '');
insert into country_code values ('B', '');
insert into country_code values ('C', '');
insert into country_code values ('D', '');
insert into country_code values ('E', '');
insert into country_code values ('F', '');
insert into country_code values ('G', '');
insert into country_code values ('H', '');
insert into country_code values ('I', '');
insert into country_code values ('J', '');
insert into country_code values ('K', '');
insert into country_code values ('L', '');
insert into country_code values ('M', '');
insert into country_code values ('N', '');
insert into country_code values ('O', '');
insert into country_code values ('P', '');
insert into country_code values ('Q', '');
insert into country_code values ('R', '');
insert into country_code values ('S', '');
insert into country_code values ('T', '');
insert into country_code values ('U', '');
insert into country_code values ('V', '');
insert into country_code values ('W', '');
insert into country_code values ('X', '');
insert into country_code values ('Y', '');
insert into country_code values ('Z', '');
commit;

drop table earth_marker_tb;
create table earth_marker_tb (
    alpha_two_code varchar2(2) references country_code,
    landmark varchar2(64),
    latitude number,
    longitude number,
    img_url varchar2(2048)
);

insert into earth_marker_tb values ('AU', 'Sydney Opera House', -33.85678581090873, 151.21529563018993, 'https://www.listchallenges.com/f/items/baccf057-63ee-4aa5-aab6-f0f1212d8fb7.jpg');
insert into earth_marker_tb values ('AU', 'Uluru', -25.34442935146111, 131.03688205246655, 'https://www.listchallenges.com/f/items/7fb2cd5d-8abc-40a8-a25d-5aa7c8ebd216.jpg');
insert into earth_marker_tb values ('BR', 'Christ the Redeemer', -22.95191766707672, -43.21048718358794, 'https://www.listchallenges.com/f/items/00472c34-0bbb-495c-8d3d-15b4e77918d1.jpg');
insert into earth_marker_tb values ('CL', 'Moai', -27.143964210405834, -109.33049923928347, 'https://www.listchallenges.com/f/items/6113cc48-e777-4474-bad1-481f7abd07d3.jpg');
insert into earth_marker_tb values ('CN', 'Great Wall of China', 40.43190625811218, 116.57037462757219, 'https://www.listchallenges.com/f/items/a0015a10-617f-4077-a734-1d030ed48058.jpg');
insert into earth_marker_tb values ('DE', 'Berlin Wall', 52.507180294878474, 13.38350549528898, 'https://www.listchallenges.com/f/items/ecf6bcac-2010-4b2a-bfba-a138602c9610.jpg');
insert into earth_marker_tb values ('DK', 'Nyhavn', 55.67977493741472, 12.591304414302332, 'https://www.listchallenges.com/f/items-dl/5f61f3d7-e72f-4a00-b729-e8b8b6167aef.jpg');
insert into earth_marker_tb values ('EG', 'Great Pyramid of Giza', 29.97923299710245, 31.13420122099721, 'https://www.listchallenges.com/f/items/66b160d7-d2f9-4dca-887b-ae38651e69c7.jpg');
insert into earth_marker_tb values ('FR', 'Eiffel Tower', 48.85836913732332, 2.2944810216658094, 'https://www.listchallenges.com/f/items/4e76ea71-f275-44df-a98f-0f75f9771a65.jpg');
insert into earth_marker_tb values ('GB', 'Big Ben', 51.50072808026876, -0.1246256436939679, 'https://www.listchallenges.com/f/items/2c6fce4f-e410-4d50-80b6-870bc945b17b.jpg');
insert into earth_marker_tb values ('GB', 'Stonehenge', 51.17888055584205, -1.8262150592416728, 'https://www.listchallenges.com/f/items/a5f9eb7d-71f2-4710-a4c6-7c04a634c319.jpg');
insert into earth_marker_tb values ('IE', 'Newgrange', 53.69471085263502, -6.47549176030871, 'https://www.listchallenges.com/f/items/cea40c98-ae81-4980-8d43-07ba977917a3.jpg');
insert into earth_marker_tb values ('IL', 'Western Wall', 31.776717233209467, 35.2345079964759, 'https://www.listchallenges.com/f/items/6b3f2257-1ed4-4273-ad2f-48bc567820ed.jpg');
insert into earth_marker_tb values ('IN', 'Taj Mahal', 27.175143641271443, 78.0421416446706, 'https://www.listchallenges.com/f/items/4dd9d779-3bc9-49d8-89d5-a34b133c6ab3.jpg');
insert into earth_marker_tb values ('IT', 'Colosseum', 41.89020864142666, 12.492230497868867, 'https://www.listchallenges.com/f/items/e71fd9ad-6027-44f2-93df-b0a284507c74.jpg');
insert into earth_marker_tb values ('IT', 'Leaning Tower of Pisa', 43.722950638562374, 10.396596501335175, 'https://www.listchallenges.com/f/items/bb1fa37e-fd85-43ef-87a6-02387af5dc25.jpg');
insert into earth_marker_tb values ('JP', 'Tokyo Tower', 35.65857925940548, 139.7454328672275, 'https://www.listchallenges.com/f/items/314a88a3-11a8-43cf-9369-4ce047cd0dfc.jpg');
insert into earth_marker_tb values ('KR', 'Gyeongbokgung', 37.57961546157773, 126.97704023412163, 'https://lh5.googleusercontent.com/proxy/XmnHVngvJ-_FVag6Ma79DoDsi0qverft5987BW75y6GNmBPr_G_mJJptp_TfLztBfDRbZxUOjb4xwd2u-b43X4FtGGhqOrSMN9yRO6ik_GSMCBbgb2uiFuMhSCWuL9iSttVS2afN9fYBZH6bZXZkUDknj0GnMo8=w408-h270-k-no');
insert into earth_marker_tb values ('RU', 'St. Basil''s Cathedral', 55.7525218404382, 37.62308709017052, 'https://www.listchallenges.com/f/items/8e410b50-6290-4c99-b92a-4bac3cb8b719.jpg');
insert into earth_marker_tb values ('TZ', 'Mount Kilimanjaro', -3.067426845692697, 37.35562636976589, 'https://www.listchallenges.com/f/items/0b047c9f-99e5-4f38-83f8-547f2dbe085f.jpg');
insert into earth_marker_tb values ('US', 'Golden Gate Bridge', 37.8199116294378, -122.47825510205308, 'https://www.listchallenges.com/f/items/6b26ad11-44d1-497c-897b-65ae86f67273.jpg');
insert into earth_marker_tb values ('US', 'Hollywood', 26.011513680538773, -80.14304728416546, 'https://www.listchallenges.com/f/items/db282a05-f160-40b3-8129-035bcd322ccb.jpg');
insert into earth_marker_tb values ('US', 'Statue of Liberty', 40.68924788775158, -74.04450128301255, 'https://www.listchallenges.com/f/items/a45acde9-68c5-4871-b49c-0a630890076b.jpg');
commit;
