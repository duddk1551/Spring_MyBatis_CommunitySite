DROP DATABASE IF EXISTS `cuni`;

CREATE DATABASE `cuni`;

USE `cuni`;

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` CHAR(100) NOT NULL,
  `body` TEXT NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `boardId` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `articleReply`;

CREATE TABLE `articleReply` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `articleId` int(10) UNSIGNED NOT NULL,
  `boardId` int(10) UNSIGNED NOT NULL,
  `memberId` int(10) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `name` char(100) NOT NULL,
  PRIMARY KEY (`id`)
);

insert  into `board`(`id`,`regDate`,`name`) values 
(1,'2019-05-27 22:54:25','자유게시판'),
(2,'2019-05-27 22:54:36','공지사항');

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `loginId` char(100) NOT NULL,
  `loginPw` char(100) NOT NULL,
  `name` char(100) NOT NULL,
  `emailAuthKey` char(100) NOT NULL,
  `emailAuthStatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `delStatus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `email` char(100) NOT NULL,
  `permissionLevel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);

insert  into `member`(`id`,`regDate`,`loginId`,`loginPw`,`name`,`emailAuthKey`,`emailAuthStatus`,`delStatus`,`email`,`permissionLevel`) values 
(1,'2019-05-27 22:54:25','user1','user1','홍길동','',1,0,'user1@test.com',1),
(2,'2019-05-27 22:54:36','user2','user2','홍길순','',1,0,'user2@test.com',0);

select *
from member;

update member
set delStatus = 0
where id = 1;

insert into `article` (`regDate`,`title`,`body`,`memberId`,`boardId`) values (NOW(),'검색용제목','내용',1,1);

SELECT A.*,M.name as article__writer, COUNT(DISTINCT AR.id) AS extra__repliesCount
FROM article AS A
LEFT JOIN articleReply AS AR
ON A.id = AR.articleId
Left join member as M
on M.id = A.memberId
WHERE 1 = 1
AND A.boardId = 1
GROUP BY A.id
ORDER BY A.id DESC

select *
from articleReply;

SELECT AR.*,M.name as ReplyWriter
FROM articleReply as AR
LEft join member as M
on M.id = AR.memberId
WHERE AR.articleId = 21
group by AR.id
order by AR.id ASC;

select count(*)
from article
WHERE boardId = 2;


insert into article
set regDate = NOW(),
title = '제목',
body = '내용',
memberId = 1,
boardId = 2

select *
from board;

insert into article
(regDate,title,body,memberId,boardId)
select regDate,title,body,memberId,boardId
from article
where boardId = 2

select COUNT(*)
from article;

CREATE INDEX article_index
ON article (boardId);

DROP INDEX article_index;

 

SELECT * FROM id

WHERE TABLE_NAME='article';


explain select sql_no_cache COUNT(*)
from article
where boardId = 1

SELECT SQL_NO_CACHE COUNT(*)
FROM article
WHERE boardId = 1
# 0.005
# 0.082

use `a2`;

select *
from article;

insert into article
set regDate = NOW(),
title = '제목',
body = '내용',
memberId = 2,
boardId = 1;

SELECT A.*, M.name AS writer
,COUNT(DISTINCT AR.id) AS replyCount
		
		FROM article AS A

			LEFT OUTER JOIN articleReply AS AR
			ON A.id = AR.articleId
		LEFT OUTER JOIN `member` AS M
		ON A.memberId = M.id
		WHERE A.boardId = 2
		GROUP BY A.id
		ORDER BY 1=1

select *
from member;

update member
set memberLevel = 2
where id = 3;

use `a2`;

select *
from board;

select *
from member;

update board
set `name` = '우수게시판'
where id = 3;

SELECT *
FROM member
WHERE loginId = 'thdoFI'
AND loginPw = '1234'