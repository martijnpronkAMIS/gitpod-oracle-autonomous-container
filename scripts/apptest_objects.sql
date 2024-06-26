CREATE TABLE team
  (team_id    INTEGER GENERATED BY DEFAULT ON NULL AS IDENTITY,
   name       VARCHAR2(255) NOT NULL UNIQUE,
   points     INTEGER NOT NULL,
   CONSTRAINT team_pk PRIMARY KEY(team_id));

CREATE TABLE driver 
  (driver_id  INTEGER GENERATED BY DEFAULT ON NULL AS IDENTITY,
   name       VARCHAR2(255) NOT NULL UNIQUE,
   points     INTEGER NOT NULL,
   team_id    INTEGER,
   CONSTRAINT driver_pk PRIMARY KEY(driver_id),
   CONSTRAINT driver_fk FOREIGN KEY(team_id) REFERENCES team(team_id));

CREATE INDEX driver_fk_idx ON driver (team_id);

create json duality view team_dv as
  select json {'_id' : t.team_id, 'name': t.name, 'points':t.points} 
  from team t with insert update delete;

create json duality view team_driver_dv as
  select json {'_id': t.team_id, 'name': t.name, 'points': t.points,
                'driver':
                [ select json {'driver_id': d.driver_id, 'name': d.name, 'points': d.points}
                    from driver d with insert update
                    where d.team_id = t.team_id ]}
  from team t with insert update delete;

insert into team (team_id, name, points) values (1,'Redbull',0),(2,'Ferrari',0),(3,'McLaren',0),(4,'Mercedes',0);

insert into driver (name, points, team_id) values ('Max Verstappen', 0, 1),
                                                  ('Charles Leclerc',0,2),
                                                  ('Sergio Perez', 0, 1),
                                                  ('Lewis Hamilton',0,4);

commit;

exit