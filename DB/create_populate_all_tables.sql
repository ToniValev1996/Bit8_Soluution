create database student_db;

use student_db;

create table discipline
(
    professor_name varchar(128) charset utf8 null,
    name           varchar(128) charset utf8 null,
    id             int auto_increment
        primary key
);

create index disciplines_id_index
    on discipline (id);


create table semester
(
    name varchar(128) charset utf8 not null,
    id   int                       not null
        primary key
);

create table discipline_semester
(
    id            int auto_increment
		primary key,
    semester_id   int not null,
    discipline_id int not null,
    constraint discipline_semester_disciplines_id_fk
        foreign key (discipline_id) references discipline (id),
    constraint discipline_semester_semester_id_fk
        foreign key (semester_id) references semester (id)
);

create table student
(
    id          int auto_increment
        primary key,
    name        varchar(128) charset utf8 not null,
    semester_id int                       null,
    constraint student_semester_id_fk
        foreign key (semester_id) references semester (id)
);

create table student_scores
(
    id                     int auto_increment
        primary key,
    discipline_semester_id int           not null,
    student_id             int           not null,
    score                  decimal(2, 1) null,
    constraint student_score_discipline_semester_id_fk
        foreign key (discipline_semester_id) references discipline_semester (id),
    constraint student_score_student_id_fk
        foreign key (student_id) references student (id)
);


INSERT INTO student_db.discipline (professor_name, name, id) VALUES ('Isaac Newton', 'Physics', 1);
INSERT INTO student_db.discipline (professor_name, name, id) VALUES ('Albert Einstein', 'Mathematics', 2);

select * from discipline;

INSERT INTO student_db.discipline_semester (id, semester_id, discipline_id) VALUES (1, 1, 1);
INSERT INTO student_db.discipline_semester (id, semester_id, discipline_id) VALUES (2, 1, 2);
INSERT INTO student_db.discipline_semester (id, semester_id, discipline_id) VALUES (3, 2, 1);
INSERT INTO student_db.discipline_semester (id, semester_id, discipline_id) VALUES (4, 2, 2);

select * from discipline_semester;


INSERT INTO student_db.semester (name, id) VALUES ('First Semester 2021', 1);
INSERT INTO student_db.semester (name, id) VALUES ('Second Semester 2021', 2);

select * from semester;

INSERT INTO student_db.student (id, name) VALUES (1, 'Toni Valev');
INSERT INTO student_db.student (id, name) VALUES (2, 'Monika Jelqzkova');
INSERT INTO student_db.student (id, name) VALUES (3, 'Dara Valeva');
INSERT INTO student_db.student (id, name) VALUES (4, 'Sakura Jelqzkowa');


select * from student;


INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (1, 1, 1, 6.0);
INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (2, 1, 2, 5.0);
INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (3, 1, 3, 3.5);
INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (4, 1, 4, 3.0);
INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (5, 2, 1, 6.0);
INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (6, 2, 2, 5.0);
INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (7, 2, 3, 3.5);
INSERT INTO student_db.student_scores (id, discipline_semester_id, student_id, score) VALUES (8, 2, 4, 3.0);

select * from student_scores;