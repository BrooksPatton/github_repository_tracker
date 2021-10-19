create table platforms (
	id		serial primary key,
	name	text not null
);

create table languages (
	id 		serial primary key,
	name	text not null
);

create table tags (
	id		serial primary key,
	name	text not null
);

create table repositories (
	id			serial primary key,
	name		text not null,
	uri			text not null,
	platform_id	integer not null,
	language_id integer not null,
	constraint fk_platform
		foreign key(platform_id)
			references platforms(id)
				on delete cascade,
	constraint fk_language
		foreign key(language_id)
			references languages(id)
				on delete cascade
);

create table repository_tag (
	id				serial primary key,
	repository_id	integer not null,
	tag_id			integer not null,
	constraint fk_repository
		foreign key(repository_id)
			references repositories(id)
				on delete cascade,
	constraint fk_tag
		foreign key(tag_id)
			references tags(id)
				on delete cascade
);