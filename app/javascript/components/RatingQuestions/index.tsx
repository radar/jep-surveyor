import * as React from "react";
import axios from "axios";
import * as styles from "./index.module.scss";
import RatingQuestion from "./RatingQuestion";
import Form from "./Form";

interface Question {
  id: string;
  title: string;
  url: string;
}

interface RatingQuestionsProps {
  questions: Question[];
  addQuestions?: Function;
}

interface RatingQuestionsState {
  questions: Question[];
}

class RatingQuestions extends React.Component<
  RatingQuestionsProps,
  RatingQuestionsState
> {
  state = {
    questions: this.props.questions
  };
  addQuestion = question => {
    console.log("this is addQuestion" + question);
    let newQuestions = this.state.questions;
    newQuestions.push(question);

    // console.log(this.state.questions.push(question));
    this.setState({ questions: newQuestions });
  };

  // fetchQuestions = () => {
  //   axios
  //     .get("http://localhost:3000/rating_questions")
  //     .then(response => this.setState({ questions: response.data.title }));
  // };
  deleteQuestion = id => {
    axios
      .delete(`http://localhost:3000/rating_questions/${id}`)
      .then((response: {}) => this.fReact(id))
      .catch((err: {}) => console.log(err));
  };
  fReact = id => {
    console.log(this.state.questions);
    const newArr = this.state.questions.filter(question => question.id !== id);
    console.log(newArr);
    this.setState({ questions: newArr });
  };

  render() {
    return (
      <div className={styles.mainBody}>
        <h1 className={styles.mainTitle}>React+Rails</h1>
        <a className={styles.listOfQuestionsLink} href="/rating_questions/new">
          New Question
        </a>
        <Form addQuestion={this.addQuestion} />
        <div
          className={styles.listOfQuestions}
          data-automation-id="questions-list"
        >
          {this.state.questions.map(question => (
            <RatingQuestion
              deleteQuestion={this.deleteQuestion}
              {...question}
            />
          ))}
          <a className={styles.listOfQuestionsLink} href="/rating_questions">
            all questions
          </a>
        </div>
      </div>
    );
  }
}

export default RatingQuestions;
