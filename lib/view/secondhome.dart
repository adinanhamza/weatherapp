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
      if (providerdata.weather.isNotEmpty)
        Row(
          children: [
            Icon(Icons.wb_sunny, color: Colors.amber, size: 28),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  providerdata.weather.first.main,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  providerdata.weather.first.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
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
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDetailItem(Icons.thermostat, 'Min Temp', '${providerdata.main.tempMin.toStringAsFixed(1)}°C'),
            _buildDetailItem(Icons.thermostat, 'Max Temp', '${providerdata.main.tempMax.toStringAsFixed(1)}°C'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDetailItem(Icons.opacity, 'Humidity', '${providerdata.main.humidity}%'),
            _buildDetailItem(Icons.air, 'Wind Speed', '${providerdata.wind.speed.toStringAsFixed(1)} m/s'),
            _buildDetailItem(Icons.landscape, 'Pressure', '${providerdata.main.pressure} hPa'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDetailItem(Icons.location_on, 'Latitude', '${providerdata.coord.lat.toStringAsFixed(2)}'),
            _buildDetailItem(Icons.location_on, 'Longitude', '${providerdata.coord.lon.toStringAsFixed(2)}'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDetailItem(Icons.wb_twilight, 'Sunrise', 
              '${DateTime.fromMillisecondsSinceEpoch(providerdata.s