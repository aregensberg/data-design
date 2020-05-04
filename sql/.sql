

DROP TABLE IF EXISTS highlight;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS story;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile(
	profileId binary (16)not null,
	profileActivationToken char(32),
	profileEmail varchar (128) not null,
	profileHash char(97) not null,
	profileImage(****)
	primary key(profileId)
);

CREATE TABLE story(
	storyId binary(16) not null,
	storyProfileId,
	storyContent,
	storyDate,
	foreign key(storyProfileId) references profile(profileId),
	primary key(storyId)
	);

CREATE TABLE item(
	itemId binary(16) not null,
	itemStoryId,
	itemImage,
	itemDate date(3) not null,
	itemPrice decimal(3,2) not null,
	foreign key(itemStoryId) references story(storyId),
	primary key(itemId)
);

CREATE TABLE highlight(
	hightlightProfileId binary(16) not null,
	highlightStoryId binary(16) not null,
	foreign key(highlightProfileId) references profile(profileId),
	foreign key(highlightStoryId) references story(storyId)
);