import * as React from "react";

interface Question {
  id: string;
  title: string;
  url: string;
}

interface RatingQuestionProps {
  question: Question;
}

class ShowRatingQuestion extends React.Component<RatingQuestionProps, {}> {
  render() {
    return (
      // <div className={styles.list} data-automation-id="questions-list">
      //   {this.props.question.title}
      // </div>
      <div>{this.props.question.title}</div>
    );
  }
}

export default ShowRatingQuestion;
