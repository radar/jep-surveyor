import * as React from "react";
import * as styles from "./RatingQuestion.module.scss";
import Form from "./Form";
import axios from "axios";
interface RatingQuestionProps {
  id: string;
  title: string;
  url: string;
  form_url: string;
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  state = {
    formVisible: false
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

  handleDelete = () => {
    axios.delete(`/rating_questions/${this.props.id}`);
  };

  renderForm = () => {
    if (this.state.formVisible === true) {
      return (
        <Form
          form_url={this.props.form_url}
          update={true}
          id={this.props.id}
          url={this.props.url}
        />
      );
    }
  };

  render() {
    return (
      <div className={styles.ratingQuestion}>
        {this.props.title}{" "}
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
