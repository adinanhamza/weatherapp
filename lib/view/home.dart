import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/provider.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
final TextEditingController searchcontroller = TextEditingController();

@override
 void initState() {
    super.initState();
    // Load initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<weatherprovider>(context, listen: false)
          .getweatherdata("New York");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<weatherprovider>(
          builder: (context, providervalue, child) {
            final weather = providervalue.weatherdata.isNotEmpty
                ? providervalue.weatherdata.first 
                : null;
            
            return Container(
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAppBar(),
                      SizedBox(height: 30),
                      if (providervalue.isloading)
                        Center(child: CircularProgressIndicator())
                      else if (weather != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildWeatherMain(),
                            SizedBox(height: 40),
                            _buildWeatherDetails(),
                          ],
                        )
                      else
                        Center(child: Text('No weather data')),
                      SizedBox(height: 30),
                      _buildSearchBar(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    
  }

  Widget _buildAppBar() {
    return Consumer<weatherprovider>(
      builder: (context, Providerdata, child) => 
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          Text(
         '${Providerdata.weatherdata.single.main!.name}',
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
      ),
    );
  }

  Widget _buildWeatherMain() {
    return Consumer<weatherprovider>(
      builder: (context, providerdata, child) => 
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${providerdata.weatherdata.single.main!.temp?.toInt()}°C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 64,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.hourglass_empty_outlined, color: Colors.amber, size: 28),
              SizedBox(width: 10),
              Text(
                providerdata.weatherdata.single.coord!.lati.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Feels like 24.5°C',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetails() {
    return Consumer<weatherprovider>(
      builder: (context, providerdata, child) => 
       Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDetailItem(Icons.opacity, 'Humidity', '${providerdata.weatherdata.single.main?.humidity}%'),
            _buildDetailItem(Icons.air, 'Wind', '${providerdata.weatherdata.single.wind?.speed} km/h'),
            _buildDetailItem(Icons.visibility, 'visibility',' ${providerdata.weatherdata.single.main?.visibility} km'),
          ],
        ),
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

  Widget _buildSearchBar() {
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
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search city...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                // setState(() {
                //   _currentCity = value;
                //   // Add API call here
                // });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}