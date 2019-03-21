import * as React from "react";
import * as styles from "./RatingQuestion.module.scss";
import Form from "./Form";
import axios from "axios";
interface RatingQuestionProps {
  id: string;
  title: string;
  url: string;
  form_url: string;
  deleteQuestion?: Function;
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  state = {
    formVisible: false,
    title: this.props.title
  };

  updateTitle = title => {
    this.setState({
      title: title,
      formVisible: false
    });
  };

  handleClick = () => {
    if (this.state.formVisible === false) {
      this.setState({
        formVisible: true
      });
    } else {
      this.setState({
        formVisible: false
      });
    }
  };

  handleDelete = e => {
    e.preventDefault();
    axios.delete(`/rating_questions/${this.props.id}.json`).then(result => {
      console.log(result);
      this.props.deleteQuestion(this.props.id);
    });
  };

  renderForm = () => {
    if (this.state.formVisible === true) {
      return (
        <Form
          form_url={this.props.form_url}
          update={true}
          id={this.props.id}
          url={this.props.url}
          updateTitle={this.updateTitle}
        />
      );
    }
  };

  render() {
    return (
      <div className={styles.ratingQuestion}>
        {this.state.title}{" "}
        <span>
          <a href={this.props.url}>show</a>
        </span>
        <button onClick={this.handleClick}>edit</button>
        <button onClick={this.handleDelete}>delete</button>
        {this.renderForm()}
      </div>
    );
  }
}

export default RatingQuestion;
