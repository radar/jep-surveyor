import * as React from "react";
import * as styles from "./RatingQuestion.module.scss";
import Form from "./Form";

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
    return <Form form_url={this.props.form_url} update={true} />;
  };

  render() {
    return (
      <div className={styles.ratingQuestion}>
        {this.props.title}{" "}
        <span>
          <a href={this.props.url}>show</a>
        </span>
        <button onClick={this.handleClick}>edit</button>
      </div>
    );
  }
}

export default RatingQuestion;
