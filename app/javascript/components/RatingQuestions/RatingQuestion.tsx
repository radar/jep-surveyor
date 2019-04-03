import * as React from "react";
import * as styles from "./RatingQuestion.module.scss";
import Form from "./Form";
import axios from "axios";

interface RatingQuestionProps {
  id: string;
  title: string;
  deleteQuestion(id: string): void;
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  state = {
    editingTitle: false
    // value: this.props.title
  };
  changeQuestion = value => {
    axios
      .put(`http://localhost:3000/rating_questions/${this.props.id}`, {
        title: value
      })
      .then(response => this.setState({ title: value, editingTitle: false }));
  };

  beginEditing = () => {
    this.setState({ editingTitle: true });
    console.log("editing");
  };

  confirmDelete = () => {
    this.props.deleteQuestion(this.props.id);
  };
  render() {
    return (
      <div>
        <a href={`/rating_questions/${this.props.id}`}>
          <div className={styles.ratingQuestion}>{this.props.title}</div>
        </a>
        <a className={styles.options} onClick={this.beginEditing}>
          edit
        </a>
        {this.renderEditForm()}
        <a className={styles.options} onClick={this.confirmDelete}>
          delete
        </a>
      </div>
    );
  }
  renderEditForm = () => {
    if (this.state.editingTitle) {
      return (
        <Form
          key={this.props.id}
          id={this.props.id}
          changeQuestion={this.changeQuestion}
          update={true}
        />
      );
    }
  };
}

export default RatingQuestion;
