ALTER DATABASE aregensberg CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS highlight;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS story;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile(
	profileId binary (16)not null,
	profileActivationToken char(32) not null,
	profileEmail varchar (128) not null,
	profileHash char(64) not null,
	profileImage varchar(255),
	unique(profileEmail),
	primary key(profileId)
);

CREATE TABLE story(
	storyId binary(16) not null,
	storyProfileId binary (16) not null,
	storyContent char(200) not null ,
	storyDate DATE not null,
	index(storyProfileId),
	foreign key(storyProfileId) references profile(profileId),
	primary key(storyId)
	);

CREATE TABLE item(
	itemId binary(16) not null,
	itemStoryId binary(16) not null,
	itemImage varchar(255),
	itemDate DATE not null,
	itemPrice decimal(5,2) not null,
	index(itemStoryId),
	foreign key(itemStoryId) references story(storyId),
	primary key(itemId)
);

CREATE TABLE highlight(
	highlightProfileId binary(16) not null,
	highlightStoryId binary(16) not null,
	index(highlightProfileId),
	index(highlightStoryId),
	foreign key(highlightProfileId) references profile(profileId),
	foreign key(highlightStoryId) references story(storyId),
	primary key(highlightProfileId, highlightStoryId)
);