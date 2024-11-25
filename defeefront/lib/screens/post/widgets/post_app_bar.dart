import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:defeefront/widgets/basic_modal.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String url;

  const PostAppBar({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: url));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('URL이 복사되었습니다'),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  url,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Image.asset(
              'assets/icons/share.png',
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              // 공유 로직
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => BasicModal(
                  title: "어디에 저장할까요?",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _folderIcon("저장"),
                      _folderIcon("자료구조"),
                      _folderIcon("면접"),
                      _addFolderIcon(),
                    ],
                  ),
                ),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icons/cpu.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  // AI 요약 로직
                },
              ),
              Transform.translate(
                offset: const Offset(0, -10),
                child: const Text(
                  'AI',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _folderIcon(String label) {
    return Column(
      children: [
        Icon(Icons.folder, size: 50, color: Colors.blue),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _addFolderIcon() {
    return Column(
      children: [
        Icon(Icons.add_circle_outline, size: 50, color: Colors.grey),
        SizedBox(height: 5),
        Text("추가"),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
