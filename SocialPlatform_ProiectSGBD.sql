CREATE TABLE USERS
(    user_id number(4),
     username varchar2(20) constraint username_ipa not null,
     age number(3),
     country varchar2(15),
     city varchar2(15),
     email varchar2(15) constraint email_ipa unique,
     constraint pk_users_ipa primary key(user_id)
 );

 INSERT INTO USERS
VALUES(1,'justinejames00' ,20,'USA', 'New York','justine00@g.com');

INSERT INTO USERS
VALUES(2,'nick_ryan_brooks' ,25,'Canada', 'Toronto','nickryan@g.com');

INSERT INTO USERS
VALUES(3,'jen_gray' ,18,'USA', 'Austin','jen_gray@g.com');

INSERT INTO USERS
VALUES(4,'anthony_wilson_80' ,30,'UK', 'London','anthony80@g.com');

INSERT INTO USERS
VALUES(5,'faustino.mario.ramos' ,21,'Italy', 'Milan','faustino@g.com');

INSERT INTO USERS
VALUES(6,'maria_andreea' ,24,'Romania', 'Galati','maria@g.com');

 CREATE TABLE GROUPS
(    group_id number(4),
     group_name varchar2(20) constraint group_name_ipa not null,
     creation_date date default sysdate constraint creation_date_ipa not null,
     constraint pk_groups_ipa primary key(group_id)
 );
 
INSERT INTO GROUPS
VALUES(101,'Food Lovers',to_date('02-02-2019','dd-mm-yyyy'));

INSERT INTO GROUPS
VALUES(102,'Sports' ,to_date('20-09-2017','dd-mm-yyyy'));

INSERT INTO GROUPS
VALUES(103,'Art@Crafts',to_date('06-06-2015','dd-mm-yyyy'));

INSERT INTO GROUPS
VALUES(104,'Music', to_date('10-12-2020','dd-mm-yyyy'));

 CREATE TABLE POSTS
(    post_id number(4),
     user_id number(4),
     group_id number(4),
     title varchar2(50) constraint title_ipa not null,
     content varchar2(250),
     post_date date default sysdate constraint post_date_ipa not null,
     nr_reactii number(4),
     constraint pk_posts_ipa primary key(post_id),
     constraint fk_posts_ipa1 foreign key(user_id) references USERS(user_id) on delete cascade,
     constraint fk_posts_ipa2 foreign key(group_id) references GROUPS(group_id) on delete cascade
 );
 


INSERT INTO POSTS
VALUES(201, 1 ,101,'How to make a birthday cake?', 'Instructions please.',to_date('10-02-2019','dd-mm-yyyy'),0);

INSERT INTO POSTS
VALUES(202, 1 ,103,'Origami Tutorial', 'Step1: ',to_date('01-07-2018','dd-mm-yyyy'),0);

INSERT INTO POSTS
VALUES(203, 5 ,102 ,'How do I learn to play tennis?', null ,to_date('29-11-2020','dd-mm-yyyy'),0);

INSERT INTO POSTS
VALUES(204, 5 ,101, 'How to add flavour to instant ramen.', 'Add eggs.',to_date('05-11-2020','dd-mm-yyyy'),0);

INSERT INTO POSTS
VALUES(205,3 ,103,'Realistic portraits!', 'Buy my art at: ',to_date('10-06-2016','dd-mm-yyyy'),0);

INSERT INTO POSTS
VALUES(206, 6, 104, 'I like this band:', 'More info', to_date('07-01-2021','dd-mm-yyyy'),0);

---am adaugat o postare noua pentru a testa 8)
INSERT INTO POSTS
VALUES(207, 1 ,101,'I made the birthday cake!', 'With your help.',to_date('26-01-2021','dd-mm-yyyy'),0);

 CREATE TABLE BELONGS
 ( 
    user_id number(4),
    group_id number(4),
    add_date date default sysdate constraint add_date_ipa not null,
    group_role varchar2(15),
    constraint fk_belongs_to_ipa1 foreign key (user_id) references USERS(user_id),
    constraint fk_belongs_to_ipa2 foreign key (group_id) references GROUPS(group_id),
    constraint pk_belongs_to_ipa3 primary key(user_id, group_id)
 );
 

INSERT INTO BELONGS
VALUES(1,101,to_date('1-02-2019','dd-mm-yyyy'),'user');

INSERT INTO BELONGS
VALUES(1,103,to_date('06-06-2015','dd-mm-yyyy'),'admin');

INSERT INTO BELONGS
VALUES(1,104,to_date('10-12-2020','dd-mm-yyyy'),'admin');

INSERT INTO BELONGS
VALUES(5,101,to_date('05-10-2020','dd-mm-yyyy'),'user');

INSERT INTO BELONGS
VALUES(5,102,to_date('20-11-2020','dd-mm-yyyy'),'user');

INSERT INTO BELONGS
VALUES(3,103,to_date('10-02-2016','dd-mm-yyyy'),'user');

INSERT INTO BELONGS
VALUES(3,104,to_date('10-12-2020','dd-mm-yyyy'),'user');

INSERT INTO BELONGS
VALUES(2,101,to_date('10-03-2019','dd-mm-yyyy'),'user');

INSERT INTO BELONGS
VALUES(2,102,to_date('20-09-2017','dd-mm-yyyy'), 'admin');

INSERT INTO BELONGS
VALUES(4,101,to_date('02-02-2019','dd-mm-yyyy'),'admin');

  CREATE TABLE COMMENTS
(   
     comment_id number(4),
     post_id number(4),
     user_id number(4),
     content varchar2(150),
     comment_date date default sysdate constraint comment_date_ipa not null,
     constraint pk_comment_ipa primary key(comment_id),
     constraint fk_comment_ipa1 foreign key(user_id) references USERS(user_id) on delete cascade,
     constraint fk_comment_ipa2 foreign key(post_id) references POSTS(post_id) on delete cascade
 );

INSERT INTO COMMENTS
VALUES(1001, 202 ,3, 'Very helpful, thank you!',to_date('02-07-2018','dd-mm-yyyy'));

INSERT INTO COMMENTS
VALUES(1002, 203 , 2 ,'Watch this video here: ',to_date('29-11-2020','dd-mm-yyyy'));

INSERT INTO COMMENTS
VALUES(1003, 203 ,5, 'Thanks Nick.',to_date('30-11-2020','dd-mm-yyyy'));

INSERT INTO COMMENTS
VALUES(1004, 205 ,1,'You are amazing Jen!',to_date('10-06-2016','dd-mm-yyyy'));

 CREATE TABLE CONNECTS
 ( 
    user_id1 number(4),
    user_id2 number(4),
    connect_date date default sysdate constraint connect_date_ipa not null,
    constraint fk_connect_ipa1 foreign key (user_id1) references USERS(user_id),
    constraint fk_connect_ipa2 foreign key (user_id2) references USERS(user_id),
    constraint pk_connect_ipa3 primary key(user_id1,user_id2)
 );
 
INSERT INTO CONNECTS
VALUES(1,3,to_date('02-03-2016','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(1,2 ,to_date('04-06-2016','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(1,4,to_date('08-01-2017','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(1,5,to_date('10-11-2018','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(2,5,to_date('12-09-2018','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(2,3,to_date('01-12-2019','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(2,4,to_date('03-08-2019','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(3,4,to_date('27-10-2019','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(3,5,to_date('25-11-2020','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(4,5,to_date('20-05-2020','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(2,6,to_date('07-01-2021','dd-mm-yyyy'));

INSERT INTO CONNECTS
VALUES(4,6,to_date('07-01-2021','dd-mm-yyyy'));

  CREATE TABLE REACTIONS
(   
     reaction_id number(4),
     post_id number(4),
     user_id number(4),
     reaction_type varchar2(15),
     constraint pk_reaction_ipa primary key(reaction_id),
     constraint fk_reactions_ipa1 foreign key(user_id) references USERS(user_id) on delete cascade,
     constraint fk_reactions_ipa2 foreign key(post_id) references POSTS(post_id) on delete cascade
 );

INSERT INTO REACTIONS
VALUES(11, 201 ,5, 'Like');

INSERT INTO REACTIONS
VALUES(12, 201 ,3,'Like');

INSERT INTO REACTIONS
VALUES(13, 202 ,4, 'Dislike');

INSERT INTO REACTIONS
VALUES(14, 202 ,3, 'Like');

INSERT INTO REACTIONS
VALUES(15, 202 ,5,'Like');

INSERT INTO REACTIONS
VALUES(16, 203 ,2,'Dislike');

INSERT INTO REACTIONS
VALUES(17, 203 ,1, 'Like');

INSERT INTO REACTIONS
VALUES(18, 203,4,'Dislike');

INSERT INTO REACTIONS
VALUES(19, 204 ,3, 'Dislike');

INSERT INTO REACTIONS
VALUES(20, 204 ,1,'Like');

INSERT INTO REACTIONS
VALUES(21, 205 ,1, 'Like');

INSERT INTO REACTIONS
VALUES(22, 205 ,2, 'Like');

INSERT INTO REACTIONS
VALUES(23, 205 ,4, 'Like');

INSERT INTO REACTIONS
VALUES(24, 205 ,5, 'Like');

--6. Afisati id-ul, titlul si continutul postarile care apartin utilizatorului cu un id dat, cat si numarul acestora.

CREATE OR REPLACE FUNCTION nr_postari
 (v_id IN posts.user_id%TYPE DEFAULT 1)
RETURN NUMBER 
IS
    TYPE rec IS RECORD  ( id   posts.post_id%TYPE,
                          titlu  posts.title%TYPE,
                          continut posts.content%TYPE);
    TYPE t_postari IS TABLE OF rec;
    t t_postari := t_postari();
BEGIN
     SELECT post_id, title, content 
     BULK COLLECT
     INTO t
     FROM posts
     WHERE v_id = user_id;

     FOR i IN t.FIRST..t.LAST LOOP
     DBMS_OUTPUT.PUT_LINE(t(i).id|| ' '||t(i).titlu||' '||t(i).continut);
     END LOOP;

     RETURN t.count;
  
END nr_postari;
/

BEGIN
 DBMS_OUTPUT.PUT_LINE('Numarul de postari este '|| nr_postari(3));
END;
/

--7. Pentru fiecare grup existent obtineti lista utilizatorilor ce apartin grupului
--si mentionati rolul acestora.

CREATE OR REPLACE PROCEDURE utilizatori_grup
IS
CURSOR C1 IS
SELECT group_id, group_name
from groups;

CURSOR C2 IS
SELECT username,age, country , group_id, group_role
FROM users u join belongs b on(u.user_id = b.user_id);   

BEGIN
     FOR i IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE(i.group_id || ': ' || i.group_name);
        FOR j IN C2 LOOP
            IF i.group_id = j.group_id AND j.group_role = 'admin'
                THEN DBMS_OUTPUT.PUT_LINE('Admin: ' ||j.username || ' , '||j.age||' , '||j.country);
            END IF;
        END LOOP;
        
        FOR j IN C2 LOOP
            IF i.group_id = j.group_id AND j.group_role = 'user'
                THEN DBMS_OUTPUT.PUT_LINE('User: ' ||j.username || ' , '||j.age||' , '||j.country);
            END IF;
        END LOOP;
    END LOOP;
END utilizatori_grup;
/

BEGIN
utilizatori_grup;
END;
/


--8. Gasiti numarul de utilizatori care au postat in cel putin x grupuri diferite.

CREATE OR REPLACE FUNCTION nr_utilizatori
(x IN number DEFAULT 2)
RETURN NUMBER 
IS

CURSOR C1 IS
SELECT user_id
from users;

CURSOR C2 IS
SELECT user_id, p.group_id
from posts p join groups g on (p.group_id = g.group_id)
group by p.group_id,user_id; --aici am modificat

nr_post number(4);
nr number(4) :=0;
nr_grup number(4);
BEGIN
   

    FOR i IN C1 LOOP
    nr_post :=0;
        FOR j IN C2 LOOP
            IF i.user_id = j.user_id THEN
                nr_post := nr_post + 1;
            END IF;
        END LOOP;
    IF nr_post >= x THEN
    nr := nr + 1;
    END IF;
    END LOOP;
    IF nr = 0 THEN 
    DBMS_OUTPUT.PUT_LINE('Nu exista utilizatori care au postat in x grupuri diferite');
    END IF;
    RETURN nr;
    
EXCEPTION 
WHEN OTHERS THEN
 RAISE_APPLICATION_ERROR(-20002,'Eroare!');
 
END nr_utilizatori;
/

DECLARE 
x number(4) := 3;
negativ EXCEPTION;
prea_mare EXCEPTION;
nr_grup number(4);
BEGIN

 SELECT count(group_id)
 INTO nr_grup
 FROM GROUPS;
 
 IF x<=0 THEN RAISE negativ; 
 ELSIF x > nr_grup THEN RAISE prea_mare;
 ELSE DBMS_OUTPUT.PUT_LINE('Numarul de utilizatori este '|| nr_utilizatori(x));
 END IF;
 
 
EXCEPTION 
WHEN VALUE_ERROR THEN
 RAISE_APPLICATION_ERROR(-20000, 'Caracterul introdus nu este un numar!');
WHEN negativ THEN
 RAISE_APPLICATION_ERROR(-20001,'Numarul introdus nu poate fi mai mic sau egal cu 0!');
WHEN prea_mare THEN
 RAISE_APPLICATION_ERROR(-20002,'Numarul introdus este mai mare ca numarul de grupuri existente!');
WHEN OTHERS THEN
 RAISE_APPLICATION_ERROR(-20003,'Eroare!');
END;
/

--9. Pentru fiecare utilizator afisati numarul de reactii pozitive si numarul de reactii negative la postarile  dintr-un grup dat
--utilizatorilor cu care este conectat . 

CREATE OR REPLACE PROCEDURE u_conectati
(v_grup groups.group_name%TYPE DEFAULT 'Music')

IS

CURSOR C1 IS
SELECT username, user_id
from users;

CURSOR C2 IS
SELECT user_id1,user_id2
from connects;

CURSOR C3 IS
SELECT post_id, group_name ,user_id
from posts p join groups g on(p.group_id = g.group_id);

CURSOR C4 IS
SELECT post_id,reaction_id, reaction_type
from reactions;

nr_reactii_like number(4);
nr_reactii_dislike number(4);

BEGIN
FOR i IN C1 LOOP
    nr_reactii_like := 0;
    nr_reactii_dislike :=0;
    DBMS_OUTPUT.PUT_LINE('Pentru utilizatorul :' || i.username);
    FOR j IN C2 LOOP
       IF j.user_id1 = i.user_id THEN
            FOR k IN C3 LOOP
                IF k.group_name = v_grup AND k.user_id = j.user_id2  THEN
                    FOR t IN C4 LOOP
                        IF t.post_id = k.post_id AND t.reaction_type = 'Like' THEN
                            nr_reactii_like := nr_reactii_like + 1;
                        ELSIF t.post_id = k.post_id AND t.reaction_type = 'Dislike' THEN
                            nr_reactii_dislike := nr_reactii_dislike + 1;
                        END IF;
                    END LOOP;
                END IF;
            END LOOP;
       ELSIF j.user_id2 = i.user_id THEN
            FOR k IN C3 LOOP
                IF k.group_name = v_grup AND k.user_id = j.user_id1  THEN
                    FOR t IN C4 LOOP
                        IF t.post_id = k.post_id AND t.reaction_type = 'Like' THEN
                            nr_reactii_like := nr_reactii_like + 1;
                        ELSIF t.post_id = k.post_id AND t.reaction_type = 'Dislike' THEN
                            nr_reactii_dislike := nr_reactii_dislike + 1;
                        END IF;
                    END LOOP;
                END IF;
            END LOOP;
       END IF; 
    END LOOP;
    
    IF nr_reactii_like = 0 AND nr_reactii_dislike = 0  THEN DBMS_OUTPUT.PUT_LINE('Nu exista reactii.');
    ELSIF nr_reactii_dislike = 0 THEN DBMS_OUTPUT.PUT_LINE('Nu exista reactii negative. ');
                                        DBMS_OUTPUT.PUT_LINE('Numarul reactiilor pozitive: '||nr_reactii_like);
    ELSIF nr_reactii_like = 0 THEN DBMS_OUTPUT.PUT_LINE('Nu exista reactii pozitive');
                                    DBMS_OUTPUT.PUT_LINE('Numarul reactiilor negative: '||nr_reactii_dislike);
    ELSE DBMS_OUTPUT.PUT_LINE('Numarul de reactii pozitive: ' || nr_reactii_like );
         DBMS_OUTPUT.PUT_LINE('Numarul reactiilor negative: ' ||nr_reactii_dislike);
    END IF;
END LOOP;
EXCEPTION

WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20002,'Eroare!');
END u_conectati;
/

DECLARE 
x varchar2(15) := 'Art@Crafts';
not_a_group EXCEPTION;
too_many_groups EXCEPTION;
nr number(4) :=0;

CURSOR C1 IS
SELECT group_name
from groups;

BEGIN
FOR i IN C1 LOOP
    IF x = i.group_name THEN nr:= nr +1; END IF;
END LOOP;

IF nr = 0 THEN RAISE not_a_group;
ELSIF nr>1 THEN RAISE too_many_groups;
ELSE u_conectati(x);
END IF;

EXCEPTION 
WHEN not_a_group THEN
RAISE_APPLICATION_ERROR(-20000,'Nu exista nici un grup cu numele dat.');
WHEN too_many_groups THEN
RAISE_APPLICATION_ERROR(-20001,'Exista mai multe grupuri cu numele dat.');
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20002,'Eroare!');
END;
/

--10. Sa nu se poate modifica tabela users dupa deadline-ul predarii.

CREATE OR REPLACE TRIGGER deadline
BEFORE INSERT OR UPDATE OR DELETE ON users
BEGIN
 IF sysdate > to_date('08-01-2020','dd-mm-yyyy') THEN
 RAISE_APPLICATION_ERROR(-20900,'A trecut deadline-ul, nu mai poate fi modificata baza de date!');
 END IF;
END;
/

DELETE FROM users;

DROP TRIGGER deadline;

--11. De fiecare data cand se adauga o noua reactie pozitiva sa se creasca nr_reactii dintr-o postare, iar
--de fiecare data cand se adauga o noua reactie negativa sa se scada din nr_reactii.


CREATE OR REPLACE PROCEDURE reactie_insert
 (tip_reactie reactions.reaction_type%TYPE,
  id_postare reactions.post_id%TYPE)
AS
BEGIN

     IF tip_reactie = 'Like' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) + 1
         WHERE post_id = id_postare;
     ELSIF tip_reactie ='Dislike' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) - 1
         WHERE post_id = id_postare;
     END IF;

END;
/

CREATE OR REPLACE PROCEDURE reactie_delete
 (tip_reactie reactions.reaction_type%TYPE,
  id_postare reactions.post_id%TYPE)
AS
BEGIN

     IF tip_reactie = 'Like' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) -1
         WHERE post_id = id_postare;
         ELSIF tip_reactie ='Dislike' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) + 1
         WHERE post_id = id_postare;
     END IF;

END;
/

CREATE OR REPLACE PROCEDURE reactie_update
 (tip_reactie_vechi reactions.reaction_type%TYPE,
  tip_reactie_nou reactions.reaction_type%TYPE,
  id_postare reactions.post_id%TYPE)
AS
BEGIN

     IF tip_reactie_vechi = 'Like' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) - 1
         WHERE post_id = id_postare;
         ELSIF tip_reactie_vechi ='Dislike' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) + 1
         WHERE post_id = id_postare;
     END IF;
  
     IF tip_reactie_nou = 'Like' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) + 1
         WHERE post_id = id_postare;
         ELSIF tip_reactie_nou ='Dislike' THEN
         UPDATE posts
         SET nr_reactii = NVL (nr_reactii, 0) - 1
         WHERE post_id = id_postare;
     END IF;

END;
/

CREATE OR REPLACE TRIGGER adaugare_reactii
AFTER DELETE OR UPDATE OR INSERT OF reaction_type ON reactions
FOR EACH ROW
BEGIN
 IF DELETING THEN
 reactie_delete(:OLD.reaction_type,:OLD.post_id);
 ELSIF UPDATING THEN
 reactie_update(:OLD.reaction_type,:NEW.reaction_type, :OLD.post_id);
 ELSIF INSERTING THEN
 reactie_insert(:NEW.reaction_type,:NEW.post_id);
 END IF;
END;
/

SELECT * FROM POSTS;
select * from reactions;

DELETE FROM reactions;

UPDATE reactions
SET reaction_type = 'Dislike'
WHERE reaction_id = 11;

INSERT INTO REACTIONS
VALUES(11, 201 ,5, 'Like');

INSERT INTO REACTIONS
VALUES(12, 201 ,3,'Like');

INSERT INTO REACTIONS
VALUES(13, 202 ,4, 'Like');

INSERT INTO REACTIONS
VALUES(14, 202 ,3, 'Like');

INSERT INTO REACTIONS
VALUES(15, 202 ,5,'Like');

INSERT INTO REACTIONS
VALUES(16, 203 ,2,'Dislike');

INSERT INTO REACTIONS
VALUES(17, 203 ,1, 'Like');

INSERT INTO REACTIONS
VALUES(18, 203,4,'Dislike');

INSERT INTO REACTIONS
VALUES(19, 204 ,3, 'Dislike');

INSERT INTO REACTIONS
VALUES(20, 204 ,1,'Like');

INSERT INTO REACTIONS
VALUES(21, 205 ,1, 'Like');

INSERT INTO REACTIONS
VALUES(22, 205 ,2, 'Like');

INSERT INTO REACTIONS
VALUES(23, 205 ,4, 'Like');

INSERT INTO REACTIONS
VALUES(24, 205 ,5, 'Like');

--12.Defini?i un trigger care sa introduca datein tabelul audit despre utilizatorul care a folosit o
--comandã LDD (create, drop, alter). 

CREATE TABLE audit_ipa
    (nume_bd VARCHAR2(50),
     eveniment VARCHAR2(20),
     tip_obiect_referit VARCHAR2(30),
     nume_obiect_referit VARCHAR2(30),
     data TIMESTAMP(3));
     

CREATE OR REPLACE TRIGGER tabel_date
    AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
 INSERT INTO audit_ipa
 VALUES ('Irina',SYS.SYSEVENT, SYS.DICTIONARY_OBJ_TYPE, SYS.DICTIONARY_OBJ_NAME, SYSTIMESTAMP(3));
END;
/

CREATE TABLE Angajati (NR number(2));

SELECT * FROM audit_ipa;

--13. Defini?i un pachet care sã con?inã toate obiectele definite în cadrul proiectului.

CREATE OR REPLACE PACKAGE pachet_proiect AS
    FUNCTION nr_postari (v_id IN posts.user_id%TYPE DEFAULT 1)
        RETURN NUMBER; 
    PROCEDURE utilizatori_grup;
    FUNCTION nr_utilizatori (x IN number DEFAULT 2)
        RETURN NUMBER ;
    PROCEDURE u_conectati (v_grup groups.group_name%TYPE DEFAULT 'Music');
END pachet_proiect;
/

CREATE OR REPLACE PACKAGE BODY pachet_proiect AS
----ex.6
FUNCTION nr_postari (v_id IN posts.user_id%TYPE DEFAULT 1)
RETURN NUMBER 
IS
    TYPE rec IS RECORD  ( id   posts.post_id%TYPE,
                          titlu  posts.title%TYPE,
                          continut posts.content%TYPE);
    TYPE t_postari IS TABLE OF rec;
    t t_postari := t_postari();
BEGIN
     SELECT post_id, title, content 
     BULK COLLECT
     INTO t
     FROM posts
     WHERE v_id = user_id;
     
     FOR i IN t.FIRST..t.LAST LOOP
     DBMS_OUTPUT.PUT_LINE(t(i).id|| ' '||t(i).titlu||' '||t(i).continut);
     END LOOP;
     
     RETURN t.count;
END nr_postari;

----ex.7
PROCEDURE utilizatori_grup

IS
CURSOR C1 IS
SELECT group_id, group_name
from groups;

CURSOR C2 IS
SELECT username,age, country , group_id, group_role
FROM users u join belongs b on(u.user_id = b.user_id);   

BEGIN
     FOR i IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE(i.group_id || ': ' || i.group_name);
        FOR j IN C2 LOOP
            IF i.group_id = j.group_id AND j.group_role = 'admin'
                THEN DBMS_OUTPUT.PUT_LINE('Admin: ' ||j.username || ' , '||j.age||' , '||j.country);
            END IF;
        END LOOP;
        
        FOR j IN C2 LOOP
            IF i.group_id = j.group_id AND j.group_role = 'user'
                THEN DBMS_OUTPUT.PUT_LINE('User: ' ||j.username || ' , '||j.age||' , '||j.country);
            END IF;
        END LOOP;
    END LOOP;
END utilizatori_grup;

----ex.8
FUNCTION nr_utilizatori
(x IN number DEFAULT 2)
RETURN NUMBER 
IS

CURSOR C1 IS
SELECT user_id
from users;

CURSOR C2 IS
SELECT user_id, p.group_id
from posts p join groups g on (p.group_id = g.group_id)
group by p.group_id,user_id; --aici am modificat

nr_post number(4);
nr number(4) :=0;
nr_grup number(4);
BEGIN
   

    FOR i IN C1 LOOP
    nr_post :=0;
        FOR j IN C2 LOOP
            IF i.user_id = j.user_id THEN
                nr_post := nr_post + 1;
            END IF;
        END LOOP;
    IF nr_post >= x THEN
    nr := nr + 1;
    END IF;
    END LOOP;
    IF nr = 0 THEN 
    DBMS_OUTPUT.PUT_LINE('Nu exista utilizatori care au postat in x grupuri diferite');
    END IF;
    RETURN nr;
    
EXCEPTION 
WHEN OTHERS THEN
 RAISE_APPLICATION_ERROR(-20002,'Eroare!');
END nr_utilizatori;

----ex.9
 PROCEDURE u_conectati
(v_grup groups.group_name%TYPE DEFAULT 'Music')

IS

CURSOR C1 IS
SELECT username, user_id
from users;

CURSOR C2 IS
SELECT user_id1,user_id2
from connects;

CURSOR C3 IS
SELECT post_id, group_name ,user_id
from posts p join groups g on(p.group_id = g.group_id);

CURSOR C4 IS
SELECT post_id,reaction_id, reaction_type
from reactions;

nr_reactii_like number(4);
nr_reactii_dislike number(4);

BEGIN
FOR i IN C1 LOOP
    nr_reactii_like := 0;
    nr_reactii_dislike :=0;
    DBMS_OUTPUT.PUT_LINE('Pentru utilizatorul :' || i.username);
    FOR j IN C2 LOOP
       IF j.user_id1 = i.user_id THEN
            FOR k IN C3 LOOP
                IF k.group_name = v_grup AND k.user_id = j.user_id2  THEN
                    FOR t IN C4 LOOP
                        IF t.post_id = k.post_id AND t.reaction_type = 'Like' THEN
                            nr_reactii_like := nr_reactii_like + 1;
                        ELSIF t.post_id = k.post_id AND t.reaction_type = 'Dislike' THEN
                            nr_reactii_dislike := nr_reactii_dislike + 1;
                        END IF;
                    END LOOP;
                END IF;
            END LOOP;
       ELSIF j.user_id2 = i.user_id THEN
            FOR k IN C3 LOOP
                IF k.group_name = v_grup AND k.user_id = j.user_id1  THEN
                    FOR t IN C4 LOOP
                        IF t.post_id = k.post_id AND t.reaction_type = 'Like' THEN
                            nr_reactii_like := nr_reactii_like + 1;
                        ELSIF t.post_id = k.post_id AND t.reaction_type = 'Dislike' THEN
                            nr_reactii_dislike := nr_reactii_dislike + 1;
                        END IF;
                    END LOOP;
                END IF;
            END LOOP;
       END IF; 
    END LOOP;
    
    IF nr_reactii_like = 0 AND nr_reactii_dislike = 0  THEN DBMS_OUTPUT.PUT_LINE('Nu exista reactii.');
    ELSIF nr_reactii_dislike = 0 THEN DBMS_OUTPUT.PUT_LINE('Nu exista reactii negative. ');
                                        DBMS_OUTPUT.PUT_LINE('Numarul reactiilor pozitive: '||nr_reactii_like);
    ELSIF nr_reactii_like = 0 THEN DBMS_OUTPUT.PUT_LINE('Nu exista reactii pozitive');
                                    DBMS_OUTPUT.PUT_LINE('Numarul reactiilor negative: '||nr_reactii_dislike);
    ELSE DBMS_OUTPUT.PUT_LINE('Numarul de reactii pozitive: ' || nr_reactii_like );
         DBMS_OUTPUT.PUT_LINE('Numarul reactiilor negative: ' ||nr_reactii_dislike);
    END IF;
END LOOP;
EXCEPTION

WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20002,'Eroare!');
END u_conectati;

END pachet_proiect;
/

--ex.6
BEGIN
 DBMS_OUTPUT.PUT_LINE('Numarul de postari este '|| pachet_proiect.nr_postari(3));
END;
/

--ex.7
BEGIN
pachet_proiect.utilizatori_grup;
END;
/

--ex.8
DECLARE 
x number(4) := 3;
negativ EXCEPTION;
prea_mare EXCEPTION;
nr_grup number(4);
BEGIN

 SELECT count(group_id)
 INTO nr_grup
 FROM GROUPS;
 
 IF x<=0 THEN RAISE negativ; 
 ELSIF x > nr_grup THEN RAISE prea_mare;
 ELSE DBMS_OUTPUT.PUT_LINE('Numarul de utilizatori este '|| pachet_proiect.nr_utilizatori(x));
 END IF;
 
 
EXCEPTION 
WHEN VALUE_ERROR THEN
 RAISE_APPLICATION_ERROR(-20000, 'Caracterul introdus nu este un numar!');
WHEN negativ THEN
 RAISE_APPLICATION_ERROR(-20001,'Numarul introdus nu poate fi mai mic sau egal cu 0!');
WHEN prea_mare THEN
 RAISE_APPLICATION_ERROR(-20002,'Numarul introdus este mai mare ca numarul de grupuri existente!');
WHEN OTHERS THEN
 RAISE_APPLICATION_ERROR(-20003,'Eroare!');
END;
/

--ex.9
DECLARE 
x varchar2(15) := 'Art@Crafts';
not_a_group EXCEPTION;
too_many_groups EXCEPTION;
nr number(4) :=0;

CURSOR C1 IS
SELECT group_name
from groups;

BEGIN
FOR i IN C1 LOOP
    IF x = i.group_name THEN nr:= nr +1; END IF;
END LOOP;

IF nr = 0 THEN RAISE not_a_group;
ELSIF nr>1 THEN RAISE too_many_groups;
ELSE pachet_proiect.u_conectati(x);
END IF;

EXCEPTION 
WHEN not_a_group THEN
RAISE_APPLICATION_ERROR(-20000,'Nu exista nici un grup cu numele dat.');
WHEN too_many_groups THEN
RAISE_APPLICATION_ERROR(-20001,'Exista mai multe grupuri cu numele dat.');
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20002,'Eroare!');
END;
/

--14. Folosind matricea de adiacenta a grafului format din conectarile dintre utilizatori
--aflati prietenul prietenilor unui utilizator(cu care acesta nu este personal conectat)
--care este cel mai activ in platforma(are cele mai multe postari).


CREATE OR REPLACE PACKAGE pachet14 IS

 TYPE vector IS TABLE OF NUMBER(10);
 TYPE matrice IS TABLE OF vector;
 v vector :=vector();
 m matrice := matrice();

 FUNCTION nr_postari(v_user users.user_id%TYPE)
 RETURN NUMBER;
 
 FUNCTION gaseste_conectare(a connects.user_id1%TYPE,
                            b connects.user_id2%TYPE)
 RETURN NUMBER;
 
 PROCEDURE adiacenta;
 
 FUNCTION prieten2(v_user users.user_id%TYPE)
 RETURN NUMBER;
 
END pachet14;
/

CREATE OR REPLACE PACKAGE BODY pachet14 IS

        FUNCTION nr_postari(v_user users.user_id%TYPE)
        RETURN NUMBER IS numar NUMBER;
        BEGIN
            SELECT COUNT(*)
            INTO numar
            FROM posts
            WHERE user_id = v_user;
         
            RETURN numar;
        END nr_postari; 
 
        FUNCTION gaseste_conectare(a connects.user_id1%TYPE,b connects.user_id2%TYPE)
        RETURN NUMBER 
        IS 
        nr1 NUMBER;
        nr2 NUMBER;
        BEGIN
            SELECT COUNT(*)
            INTO nr1
            FROM connects
            WHERE a = user_id1 AND b = user_id2;
            
            SELECT COUNT(*)
            INTO nr2
            FROM connects
            WHERE a = user_id2 AND b = user_id1;
            
            IF nr1>0 OR nr2>0 THEN RETURN 1;
            ELSE RETURN 0;
            END IF;
            
        END gaseste_conectare;

        PROCEDURE adiacenta
        IS
         nr_useri NUMBER(6);
        BEGIN
            
            SELECT COUNT(*)
            INTO nr_useri
            FROM users;
            
            
            FOR i IN 1..nr_useri LOOP
            v.delete; m.extend;
                  FOR j IN 1..nr_useri LOOP
                        v.EXTEND;
                        IF i = j THEN v(j) :=2;
                        ELSE v(j) := gaseste_conectare(i,j);
                        END IF;
                  END LOOP;
                  m(i) :=v;
            END LOOP;
        END adiacenta;
        
        FUNCTION prieten2(v_user users.user_id%TYPE)
        RETURN NUMBER
        IS
        maxx NUMBER(4):=0;
        maxx_id NUMBER(4):=0;
        BEGIN
            adiacenta;
            FOR i IN 1..m.last LOOP
                IF m(v_user)(i) = 1 THEN
                  FOR j IN 1..m.last LOOP
                        IF m(i)(j) = 1 AND m(v_user)(j) = 0 AND i!=j THEN
                            IF maxx < nr_postari(j) THEN
                                maxx := nr_postari(j);
                                maxx_id:=j;
                            END IF;
                        END IF;
                  END LOOP; 
                END IF;
            END LOOP;
            
        return maxx_id;
           
        END prieten2;
        
END pachet14;
/

DECLARE
x users.user_id%TYPE :=6; 
BEGIN
DBMS_OUTPUT.PUT_LINE('Cel mai activ user din cercul social al lui '||x|| ' este ' ||pachet14.prieten2(x));
END;


