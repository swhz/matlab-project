a1=input('a1=');
a2=input('a2=');
b1=input('b1=');
b2=input('b2=');
c1=input('c1=');
c2=input('c2=');
d1=input('d1=');
d2=input('d2=');
g=input('g=');
f0=pq(b2-b1,c2-c1,g)+pq(b2-b1,d2-d1,g)-pq(b2-b1,c2-d1,g)-pq(b2-b1,d2-c1,g)...
    +pq(a2-a1,c2-c1,g)+pq(a2-a1,d2-d1,g)-pq(a2-a1,c2-d1,g)-pq(a2-a1,d2-c1,g)...
    +pq(b2-a1,c2-d1,g)+pq(b2-a1,d2-c1,g)-pq(b2-a1,c2-c1,g)-pq(b2-a1,d2-d1,g)...
    +pq(a2-b1,c2-d1,g)+pq(a2-b1,d2-c1,g)-pq(a2-b1,c2-c1,g)-pq(a2-b1,d2-d1,g);
f12=f0/(2*pi*(b1-a1)*(d1-c1));