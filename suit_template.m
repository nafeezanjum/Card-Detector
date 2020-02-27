
%Natural Numbers
Heart=imread('SI/h.bmp');
Clubs=imread('SI/c.bmp');
Spade=imread('SI/s.bmp');
Diamond=imread('SI/d.bmp');

%Creating Array for Alphabets
Suit=[Heart ClubsSpade Diamond];


NewTemplates=[Suit];
save ('NewTemplates','NewTemplates')
clear all