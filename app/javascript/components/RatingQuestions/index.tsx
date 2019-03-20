import * as React from "react";
import * as styles from "./index.module.scss";
import RatingQuestion from "./RatingQuestion";
import Create from "./Create";

interface Question {
  id: string;
  title: string;
  url: string;
  question: Question;
  form_url: string;
}

interface RatingQuestionsProps {
  questions: Question[];
  form_url: string;
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {
  render() {
    return (
      <div className={styles.list} data-automation-id="questions-list">
        <div>
          <Create form_url={this.props.form_url} update={false} />
        </div>
        {this.props.questions.map(question => (
          <RatingQuestion
            key={question.id}
            {...question}
            form_url={question.form_url}
          />
        ))}
      </div>
    );
  }
}

export default RatingQuestions;
