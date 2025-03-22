import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/provider.dart';
import 'package:weatherapp/model/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {

  final TextEditingController _searchController = TextEditingController();

  @override
   void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<weatherprovider>(context, listen: false)
          .getweatherdata("malappuram");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: Consumer<weatherprovider>(
      builder: (context, value, child) {
        final providerdata = value.weatherdata;
        return  Container(
         decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1D2671),
                    Color(0xFFC33764),
                  ],
                ),
              ),
          child: SafeArea(
            child: Padding(

              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start  ,
                children: [
    
    buildappbar(providerdata.first.name),
    SizedBox(height: 30),
    if(value.isloading)
    Center(child: CircularProgressIndicator(),)
    else if(providerdata != null)
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
_buildMain(providerdata.first),
SizedBox(height: 40,),
_buildDetails(providerdata.first)
      ],
    )
    else
    Center(child: Text('No weather data'),),
    SizedBox(height: 40,),
    _buildSearchBar(value),
                ],
              ),
                     ),
            ),
          ),
        );
      },
     
     ),
    );
  }

Widget buildappbar(String city){
return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        Text(
          city,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );

}



  Widget _buildMain(weathermodel providerdata) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${providerdata.main.temp.toStringAsFixed(1)}°C',
          style: TextStyle(
            color: Colors.white,
            fontSize: 64,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.wb_sunny, color: Colors.amber, size: 28),
            SizedBox(width: 10),
            Text(
             providerdata.weather.first.main,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Feels like ${providerdata.main.feelsLike.toStringAsFixed(1)}°C',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

Widget _buildDetails(weathermodel providerdata) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDetailItem(Icons.opacity, 'Humidity', '${providerdata.main.humidity}%'),
          _buildDetailItem(Icons.air, 'Wind', '${providerdata.wind.speed.toStringAsFixed(1)} km/h'),
          _buildDetailItem(Icons.visibility, 'visibility', '${providerdata.visibility} Km'),
        ],
      ),
    );
  }

    Widget _buildDetailItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

    Widget _buildSearchBar(weatherprovider provider) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search city...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  provider.getweatherdata(value);
                  _searchController.clear();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                provider.getweatherdata(_searchController.text);
                _searchController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
Widget _buildFullWeatherInfo(weathermodel providerdata) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Full Weather Information:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(color: Colors.white54),
        _buildInfoRow("Temperature", "${providerdata.main.temp} °C"),
        _buildInfoRow("Pressure", "${providerdata.main.pressure} hPa"),
        _buildInfoRow("Sea Level", "${providerdata.main.sealevel}"),
        _buildInfoRow("Ground Level", "${providerdata.main.groundlevel}"),
        _buildInfoRow("Humidity", "${providerdata.main.humidity}%"),
        _buildInfoRow("Timezone", "${providerdata.timezone}"),
        _buildInfoRow("Visibility", "${providerdata.visibility}"),
        _buildInfoRow("City Name", "${providerdata.name}"),
        _buildInfoRow("Latitude", "${providerdata.coord?.lati}"),
        _buildInfoRow("Longitude", "${providerdata.coord?.long}"),
        _buildInfoRow("Wind Speed", "${providerdata.wind?.speed} km/h"),
        _buildInfoRow("Wind Direction", "${providerdata.wind?.dug}°"),
        _buildInfoRow("Country", "${providerdata.sys?.country}"),
        _buildInfoRow("Sunrise", "${providerdata.sys?.sunrise}"),
        _buildInfoRow("Sunset", "${providerdata.sys?.sunset}"),
      ],
    );
  }

  // Helper widget to display a row of information
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

}
