use [NYC]
GO
Select [Tripdate],[Triphour],[Temp],[Relativehumidity],[Dewpoint],[Precipitation],[Rain],[Snowfall],[Windspeed],[Windgusts],[Subscriber],[Customer],([Subscriber] + [Customer]) as Total from 

(
Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201401]
) as main1
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub1

union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201402]
) as main2
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub2

union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201403]
) as main3
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub3

union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201404]
) as main4
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub4

union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201405]
) as main5
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub5

union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201406]
) as main6
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub6

 union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201407]
) as main7
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub7
union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201408]
) as main8
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub8

union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201409]
) as main9
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub9
union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201410]
) as main10
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub10

 union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201411]
) as main11
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub11
union 

Select [Tripdate],[TripHour],[Subscriber],[Customer] from
(
	  SELECT 
      cast (starttime as DATE) AS Tripdate,
	  cast( datename(hour,[starttime]) as int) AS TripHour,
	  usertype
from [dbo].[201412]
) as main12
PIVOT
      (
	  count(usertype)
	  FOR [usertype] in ([Subscriber],[Customer])
	  ) as sub12

) as A

LEFT JOIN

(
select 
Date,
cast(datename(hour,Time) as int) as weatherhour,
Temp,
Relativehumidity,
Dewpoint,
Precipitation,
Rain,
Snowfall,
Windspeed,
Windgusts
from [dbo].[weather]) as B

ON B.Date = A.Tripdate AND B.weatherhour=A.TripHour

ORDER BY Tripdate,TripHour ASC