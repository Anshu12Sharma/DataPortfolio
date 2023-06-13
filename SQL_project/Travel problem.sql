create table travel (
source varchar(50),
destination varchar(50),
distance varchar(50));

select * from travel;

insert into travel (source, destination, distance)
values
('Mumbai', 'Bangalore', 500),
('Bangalore','Mumbai', 500),
('Delhi', 'Mathura', 150),
( 'Mathura','Delhi', 150),
('Nagpur', 'Pune', 500),
( 'Pune','Nagpur', 500);

-- method 1 using gretest and least 

select greatest(source, destination), least(source, destination), max(distance)
from travel
group by greatest(source, destination), least(source, destination);

-- method 2 using sub query--  

select *
from travel as t1
where not exists( select * from travel as t2
					where t1.source=t2.destination
                    and t1.destination=t2.source
                    and t1.destination>t2.destination
                    )

