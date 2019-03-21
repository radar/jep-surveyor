import * as React from "react";
import * as styles from "./index.module.scss";
import RatingQuestion from "./RatingQuestion";
import Create from "./Create";

interface Question {
  id: string;
  title: string;
  url: string;
  form_url: string;
}

interface RatingQuestionsProps {
  questions: Question[];
  form_url: string;
  id: string;
  url: string;
  addQuestions?: Function;
}

class RatingQuestions extends React.Component<RatingQuestionsProps> {
  state = {
    questions: this.props.questions
  };

  deleteQuestion = id => {
    let questions = this.props.questions.filter(question => question.id !== id);
    console.log(questions);
    this.setState({ questions });
  };

  addQuestion = question => {
    let questions = this.props.questions.push(question);
    this.setState({ questions });
  };

  render() {
    return (
      <div className={styles.list} data-automation-id="questions-list">
        <div>
          <Create
            form_url={this.props.form_url}
            update={false}
            id={this.props.id}
            url={this.props.url}
            addQuestion={this.addQuestion}
          />
        </div>
        {this.props.questions.map(question => (
          <RatingQuestion
            key={question.id}
            {...question}
            form_url={question.form_url}
            deleteQuestion={this.deleteQuestion}
          />
        ))}
      </div>
    );
  }
}

export default RatingQuestions;
