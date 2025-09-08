import 'package:flutter/material.dart';
import 'package:my_market_admin/core/components/custom_elevated_button.dart';
import 'package:my_market_admin/core/components/custom_text_form_field.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Comments'),
      body: ListView.builder(itemBuilder: (context, index) =>  CommentCard(), itemCount: 10,),
    );
  }
}

class CommentCard extends StatelessWidget {
   CommentCard({
    super.key,
  });
 final TextEditingController _replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 220,
        child: Card(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Comment: this is user comment',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text('Reply: this is user Reply', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(labelText: 'Reply', controller: _replyController,),
                
              ),
              SizedBox(height: 10),
              CustomElevatedButton(
                child: const Text('Reply'),
                onPressed: () {},
              ),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

}
