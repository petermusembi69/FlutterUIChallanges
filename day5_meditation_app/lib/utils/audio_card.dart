part of day5_utils;

class AudioCard extends StatelessWidget {
  const AudioCard(this.item, {Key? key}) : super(key: key);
  final item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0,top: 0),
      child: Column(
        children: [
          Divider(
            thickness: 1,
            color: Colors.grey.shade400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.orange,
                  size: 52,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${item['artist']}  | ${item['duration']}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.green.shade200,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
