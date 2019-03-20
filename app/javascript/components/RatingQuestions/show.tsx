import * as React from "react";
import Update from "./Update";

interface Question {
  id: string;
  title: string;
  url: string;
}

interface RatingQuestionProps {
  question: Question;
  id: string;
  url: string;
}

class ShowRatingQuestion extends React.Component<RatingQuestionProps, {}> {
  render() {
    return (
      // <div className={styles.list} data-automation-id="questions-list">
      //   {this.props.question.title}
      // </div>
      <div>
        {this.props.question.title}
        <Update
          form_url={this.props.question.url}
          id={this.props.id}
          url={this.props.url}
        />
      </div>
    );
  }
}

export default ShowRatingQuestion;
