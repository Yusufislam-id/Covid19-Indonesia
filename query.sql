-- No.1 Jumlah total kasus Covid-19 aktif yang baru di setiap provinsi lalu diurutkan berdasarkan jumlah kasus yang paling besar
-- => new_active_case per prov

SELECT Province, SUM(New_Active_Cases) AS Total_Kasus_Aktif_Baru
FROM `covid.covid`
GROUP BY Province
ORDER BY Total_Kasus_Aktif_Baru DESC;

--No.2 Mengambil 2 (dua) location iso code yang memiliki jumlah total kematian karena Covid-19 paling sedikit
-- => aggregate death per provinsi

SELECT Location_ISO_Code, SUM(Total_Deaths) AS Total_Kematian
FROM `covid.covid`
GROUP BY Location_ISO_Code
ORDER BY Total_Kematian
LIMIT 3;

--No.3 Data tentang tanggal-tanggal ketika rate kasus recovered di Indonesia paling tinggi beserta jumlah ratenya
-- => aggregate recovered/total case dari semua province (level Indonesia) per date

SELECT Date, SUM(Case_Recovered_Rate) AS Total_Case_Recovered_Rate
FROM `covid.covid`
GROUP BY Date
ORDER BY Total_Case_Recovered_Rate DESC;


--No.4 Total case fatality rate dan case recovered rate dari masing-masing location iso code yang diurutkan dari data yang paling rendah
-- Aggregate death / total case  and recovered /total case per province and sort the result

SELECT Location_ISO_Code, SUM(Case_Fatality_Rate) AS Total_Case_Fatality_Rate, SUM(Case_Recovered_Rate) AS Total_Case_Recovered_Rate
FROM `covid.covid`
GROUP BY Location_ISO_Code
ORDER BY Total_Case_Fatality_Rate, Total_Case_Recovered_Rate;

--No.5 Data tentang tanggal-tanggal saat total kasus Covid-19 mulai menyentuh angka 30.000-an
-- Data cumulative total case >=30,000, sort by date.

SELECT Date, Total_Cases
FROM `covid.covid`
WHERE Total_Cases >= 30000
ORDER BY Date;

--No.6 Jumlah data yang tercatat ketika kasus Covid-19 lebih dari atau sama dengan 30.000
-- Data cumulative total case >=30,000, then count.

SELECT COUNT(Total_Cases) AS Total_Case_Record
FROM `covid.covid`
WHERE Total_Cases >= 30000;

