-- Question 1
SELECT Pantheon, COUNT(*) AS "Number of Gods" 
FROM God
GROUP BY Pantheon
ORDER BY COUNT(*) DESC, Pantheon ASC;


-- Question 2
SELECT 
    ROUND(MIN(Price), 2) AS "Min Price",
    ROUND(MAX(Price), 2) AS "Max Price",
    ROUND(AVG(Price), 2) AS "AVG Price"
FROM Item;


-- Question 3
SELECT 
    Effect_Type, 
    COUNT(DISTINCT Effect_ID) AS " Number of effects" 
FROM Effect
GROUP BY Effect_Type
ORDER BY Effect_Type ASC;


--Question 4
SELECT Name AS "Item name" , Price
FROM Item
WHERE Price < (SELECT AVG(Price) FROM Item)
ORDER BY Price ASC, Name ASC;


-- --Question 5
 SELECT Pantheon, Name AS "God's Name" , Description, Role_ID
 FROM God
 WHERE Role_ID = (SELECT Role_ID FROM Role WHERE Name = 'WARRIOR')
 ORDER BY Pantheon ASC, Name ASC;


-- Question 6
SELECT Name AS "God's Name", Description
FROM God
WHERE Pantheon = (SELECT Pantheon FROM God WHERE Name = 'THOR')
ORDER BY Name ASC;


-- Question 7 
SELECT 
    g.Pantheon, 
    g.Name AS "God's Name", 
    g.Description, 
	r.Name AS Name
FROM 
    God g
JOIN 
    Role r ON g.Role_ID = r.Role_ID
WHERE 
    r.Name = 'HUNTER'
ORDER BY 
    g.Pantheon ASC, g.Name ASC;
	

--Question 8
SELECT 
    g.Pantheon, 
    r.Name AS Role, 
    COUNT(*) AS "Number of Gods"
FROM God g
JOIN Role r ON g.Role_ID = r.Role_ID
WHERE r.Name = 'MAGE'
GROUP BY g.Pantheon
ORDER BY g.Pantheon ASC;


-- Question 9
SELECT DISTINCT 
    i.Item_ID, 
    i.Name AS "Item's Name", 
    i.Price, 
    e.Effect_Type AS Effect
FROM Item i
JOIN Item_Effect ie ON i.Item_ID = ie.Item_ID
JOIN Effect e ON ie.Effect_ID = e.Effect_ID
WHERE e.Effect_Type = 'DEFENSIVE' AND i.Price < 1000
ORDER BY i.Price ASC, i.Name ASC;


--Question 10
SELECT 
    i.Item_ID, 
    i.Name AS "Item's Name", 
    i.Price, 
    e.Name AS Effect
FROM Item i
JOIN Item_Effect ie ON i.Item_ID = ie.Item_ID
JOIN Effect e ON ie.Effect_ID = e.Effect_ID
WHERE e.Name = 'Attack Speed'
ORDER BY i.Price DESC;




