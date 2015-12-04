
CREATE TABLE Installations (
	id SERIAL PRIMARY KEY,
	city TEXT NOT NULL,
	country TEXT NOT NULL,
	school_affliation TEXT NOT NULL,
	local_admin_id INT  NOT NULL REFERENCES Users(id),
	delegate_list INT[] NOT NULL, /* NEED TO FIX THIS, SHOULD HAVE REFERENCE */
	is_online BOOLEAN NOT NULL,
	last_data_update INT NOT NULL,
	GPS_location_x INT NOT NULL,
	GPS_location_y INT NOT NULL
);

/*has not been tested*/
CREATE OR REPLACE FUNCTION public.get_installations()
RETURNS TABLE(id INT, City TEXT, Country TEXT,
	SchoolAffliation TEXT, LocalAdminId INT, DelegateList INT[], Online BOOLEAN,
	LastDataUpdate INT, GPSLocationX INT, GPSLocationY INT) 
AS $all_installations$
BEGIN
	RETURN QUERY SELECT * FROM installations;
END;
$all_installations$ LANGUAGE plpgsql;

/*has not been tested*/
CREATE OR REPLACE FUNCTION public.add_installation(City TEXT, Country TEXT,
	SchoolAffliation TEXT, LocalAdminId INT, DelegateList INT[], Online BOOLEAN,
	LastDataUpdate INT, GPSLocationX INT, GPSLocationY INT)
RETURNS void as $$
BEGIN
	INSERT INTO installations VALUES(DEFAULT
	,City
	,Country
	,SchoolAffliation
	,LocalAdminId
	,DelegateList
	,Online
	,LastDataUpdate
	,GPSLocationX
	,GPSLocationY);
END;
$$ LANGUAGE plpgsql;


/*has not been tested*/
CREATE OR REPLACE FUNCTION public.delete_installation(installationID INT)
RETURNS void AS $$
BEGIN
 	DELETE FROM installations WHERE installtion_id=installtionID;
END;
$$ LANGUAGE plpgsql;

/*has not been tested*/
CREATE OR REPLACE FUNCTION public.disable_installation(installationID INT)
RETURNS void AS $$
BEGIN
 	UPDATE installations SET is_online=false WHERE installtion_id=installtionID;
END;
$$ LANGUAGE plpgsql;

/*has not been tested*/
CREATE OR REPLACE FUNCTION public.get_local_delegates(installationID INT)
RETURNS INT[]
AS $all_delegates$
BEGIN
	RETURN QUERY SELECT delegate_list FROM installations WHERE installtion_id=installtionID;
END;
$all_delegates$
$$ LANGUAGE plpgsql;