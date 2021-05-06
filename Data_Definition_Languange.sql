CREATE DATABASE theory_examination

USE theory_examination

CREATE TABLE Users(
	UserId CHAR(6) PRIMARY KEY,
	LastName VARCHAR(256),
	FirstName VARCHAR(256),
	School VARCHAR(100),
	Address_ VARCHAR(200),
	Email VARCHAR(100),
	PhoneNumber VARCHAR(13),
	Location_ VARCHAR(50),
	DateOfBirth CHAR(10),
	Gender VARCHAR(10)
)

SELECT * FROM Users

CREATE TABLE Friends(
	FriendId CHAR(6),
	UserId CHAR(6),
	CONSTRAINT FriendsPK primary key(FriendId),
	CONSTRAINT FriendsFK foreign key(UserId) REFERENCES Users(UserId)
)

SELECT * FROM Friends

CREATE TABLE PageLikes(
	PageId CHAR(6),
	UserId CHAR(6),
	CONSTRAINT PageLikesPK primary key(PageId),
	CONSTRAINT PageLikesFK foreign key(UserId) REFERENCES Users(UserId)
)

SELECT * FROM PageLikes

CREATE TABLE Posts(
	PostId CHAR(6),
	UserId CHAR(6),
	PostDate CHAR(10),
	PostContent VARCHAR(256),
	CONSTRAINT PostsPK primary key(PostId),
	CONSTRAINT PostsFK foreign key(UserId) REFERENCES Users(UserId)
)

CREATE TABLE Pages(
	PageId CHAR(6),
	PageName VARCHAR(256),
	PageContent VARCHAR(256),
	CONSTRAINT PagesPK primary key(PageId),
	CONSTRAINT PagesFK foreign key(PageId) REFERENCES PageLikes(PageId)
)

SELECT * FROM Pages

CREATE TABLE PostLikes(
	PostId CHAR(6),
	UserId CHAR(6),
	CONSTRAINT PostLikesPK primary key(UserId),
	CONSTRAINT PostLikesFK foreign key(PostId) REFERENCES Posts(PostId)
)

SELECT * FROM PostLikes

CREATE TABLE Photos(
	PhotoId CHAR(6),
	PostId CHAR(6),
	ImageContent VARCHAR(256)
	CONSTRAINT PhotosPK primary key(PhotoId),
	CONSTRAINT PhotosFK foreign key(PostId) REFERENCES Posts(PostId)
)

SELECT * FROM Photos

CREATE TABLE Shares(
	PostId CHAR(6),
	UserId CHAR(6),
	CONSTRAINT SharesPK primary key(UserId),
	CONSTRAINT SharesFK foreign key(PostId) REFERENCES Posts(PostId)
)

SELECT * FROM Shares

CREATE TABLE Comments(
	CommentId CHAR(6),
	PostId CHAR(6),
	UserId CHAR(6),
	CommentDate CHAR(10),
	CommentContent VARCHAR(256),
	CONSTRAINT CommentsPK primary key(CommentId),
	CONSTRAINT CommentsFK foreign key(PostId) REFERENCES Posts(PostId)
)

SELECT * FROM Comments

CREATE TABLE CommentLikes(
	CommentId CHAR(6),
	UserId CHAR(6),
	CONSTRAINT CommentLikesPK primary key(UserId),
	CONSTRAINT CommentLikesFK foreign key(CommentId) REFERENCES Comments(CommentId)
)

SELECT * FROM CommentLikes