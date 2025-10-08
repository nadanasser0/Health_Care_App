import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:health_care_app/Presentation/chats/models/message_model.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
class ChatInput extends StatefulWidget {
final Function(String, {MessageType type, String? filePath}) onSend;
  const ChatInput({super.key, required this.onSend});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final AudioRecorder _recorder = AudioRecorder();

  bool _isEmojiVisible = false;
  bool _isRecording = false;
  bool _hasText = false; 
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.trim().isNotEmpty;
      });
    });
  }

  void _toggleEmojiPicker() {
    setState(() {
      _isEmojiVisible = !_isEmojiVisible;
    });
  }

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSend(_controller.text.trim());
      _controller.clear();
      setState(() => _hasText = false);
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = result.files.single;
      debugPrint("📂 File picked: ${file.name}");
    }
  }
Future<void> _openCamera() async {
  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  if (photo != null) {
    widget.onSend(photo.path); 
    _controller.clear();
  }
}
  Future<void> _startRecording() async {
    if (await _recorder.hasPermission()) {
      final path = '/storage/emulated/0/Download/my_record.m4a';
      await _recorder.start(const RecordConfig(), path: path);
      debugPrint("🎤 Recording started...");
    }
  }
Future<void> _stopRecording() async {
  final path = await _recorder.stop();
  if (path != null) {
    widget.onSend(
      "Voice message",
      type: MessageType.audio,
      filePath: path,
    );
  }
  debugPrint("🛑 Recording saved at: $path");
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon:  Icon(Icons.emoji_emotions_outlined,color:AppColors.greyColor),
              onPressed: _toggleEmojiPicker,
            ),
            const SizedBox(width: 15),

            Expanded(
              child: TextField(
                
                
                controller: _controller,
                decoration:  InputDecoration(

                  hintText: "Type a message...",hintStyle: TextStyle(color: AppColors.greyColor),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),

            IconButton(
              icon:  Icon(Icons.attach_file,color:  AppColors.greyColor),
              onPressed: _pickFile,
            ),

            IconButton(
              icon: Icon(CupertinoIcons.camera_fill,color: AppColors.greyColor),
              onPressed: _openCamera,
            ),
            SizedBox(width: 10,),

            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.blueColor,
              child: IconButton(
                icon: Icon(_hasText ? Icons.send : (_isRecording ? Icons.stop : Icons.mic),color: AppColors.whiteColor,),
                onPressed: () async {
                  if (_hasText) {
                    _sendMessage();
                  } else {
                    if (_isRecording) {
                      await _stopRecording();
                    } else {
                      await _startRecording();
                    }
                    setState(() => _isRecording = !_isRecording);
                  }
                },
              ),
            ),
          ],
        ),

        _isEmojiVisible
            ? SizedBox(
                height: 250,
                child: EmojiPicker(
                  textEditingController: _controller,
                  onEmojiSelected: (category, emoji) {},
                  config: const Config(
                    emojiViewConfig: EmojiViewConfig(
                      emojiSizeMax: 32,
                      columns: 7,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}