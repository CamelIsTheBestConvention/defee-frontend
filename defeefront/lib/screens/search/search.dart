import 'package:defeefront/screens/search/widgets/search_history.dart';
import 'package:flutter/material.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import '../../screens/search/widgets/search_bar.dart';

class Search extends StatefulWidget {
  // Stateless -> StatefulWidget으로 변경
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? selectedKeyword; //인기 키워드 선택 여부
  String? selectedMyKeyword; //내 키워드 선택 여부
  bool showPopularKeywords = false; // 인기 키워드 칩 표시 여부
  bool showMyKeywords = false; // 내 키워드 칩 표시 여부

  // Dummy Data
  final List<String> popularKeywords = ['인기 키워드1', '스바라시 키워드2', '슈퍼 키워드3', '핫한 키워드', '여긴 뭐쓰지'];
  final List<String> myKeywords = ['내 키워드1', '백엔드 내 키워드2', '내꺼 키워드3', '내 키워드4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //상단 검색 바
            MainSearchBar(),

            SizedBox(height: 16.0),

            // 인기 키워드 드롭다운
            GestureDetector(
              onTap: () {
                setState(() {
                  showPopularKeywords = !showPopularKeywords; // 클릭 시 표시 여부 토글
                });
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color(0xff002686),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '인기 키워드',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200), // 애니메이션 지속 시간
              curve: Curves.easeInOut, // 애니메이션 곡선
              child: Container(
                height: showPopularKeywords ? null : 0, // 높이 설정
                child: showPopularKeywords
                    ? Column(
                  // Column을 사용하여 칩과 빈 공간을 정렬
                  children: [
                    SizedBox(height: 8.0), // 위쪽 빈 공간 추가
                    Wrap(
                      spacing: 15.0, // 칩 수평 간격
                      runSpacing: 12.0, // 칩 수직 간격
                      children: [
                        ...popularKeywords.map((keyword) {
                          return Chip(
                            label: Text(
                              keyword,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 10.0), // 패딩 조정
                            backgroundColor: Color(0xffBABABA), // 칩 배경색
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              // 모서리 둥글게
                              side: BorderSide.none, // 외곽선 제거
                            ),
                          );
                        }).toList(),
                        IconButton(
                          icon: Icon(Icons.add, color: Color(0xff002686)),
                          // '+' 아이콘
                          onPressed: () {
                            // TODO: '+' 아이콘 클릭
                          },
                          color: Color(0xff002686),
                          // 아이콘 배경색
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          // 패딩 조정
                          constraints: BoxConstraints(), // 크기 조정
                        ),
                      ],
                    ),
                  ],
                )
                    : SizedBox.shrink(), // 표시하지 않을 때 빈 공간을 차지하지 않도록
              ),
            ),

            SizedBox(height: 16.0),

            // 내 키워드
            GestureDetector(
              onTap: () {
                setState(() {
                  showMyKeywords = !showMyKeywords; // 클릭 시 표시 여부 토글
                });
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color(0xff002686),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '내 키워드',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200), // 애니메이션 지속 시간
              curve: Curves.easeInOut, // 애니메이션 곡선
              child: Container(
                height: showMyKeywords ? null : 0, // 높이 설정
                child: showMyKeywords
                    ? Column(
                        // Column을 사용하여 칩과 빈 공간을 정렬
                        children: [
                          SizedBox(height: 8.0), // 위쪽 빈 공간 추가
                          Wrap(
                            spacing: 15.0, // 칩 수평 간격
                            runSpacing: 12.0, // 칩 수직 간격
                            children: [
                              ...myKeywords.map((keyword) {
                                return Chip(
                                  label: Text(
                                    keyword,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                      vertical: 10.0), // 패딩 조정
                                  backgroundColor: Color(0xffBABABA), // 칩 배경색
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    // 모서리 둥글게
                                    side: BorderSide.none, // 외곽선 제거
                                  ),
                                );
                              }).toList(),
                              IconButton(
                                icon: Icon(Icons.add, color: Color(0xff002686)),
                                // '+' 아이콘
                                onPressed: () {
                                  // TODO: '+' 아이콘 클릭
                                },
                                color: Color(0xff002686),
                                // 아이콘 배경색
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 10.0),
                                // 패딩 조정
                                constraints: BoxConstraints(), // 크기 조정
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox.shrink(), // 표시하지 않을 때 빈 공간을 차지하지 않도록
              ),
            ),

            SizedBox(height: 16.0),

            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),

            SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '기록',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // TBD : 전체 삭제 버튼 클릭
                  },
                  child: Text(
                    '전체 삭제',
                    style: TextStyle(color: Colors.grey), // 색상
                  ),
                ),
              ],
            ),

            SearchHistory(),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
