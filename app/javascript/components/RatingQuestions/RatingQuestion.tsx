import * as React from 'react'
import * as styles from './RatingQuestion.module.scss'

interface RatingQuestionProps {
  id: string,
  title: string,
  rating_question_url: string
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  render() {
    return (
      <div className={styles.ratingQuestion}>{this.props.title}</div>
    )
  }
}

export default RatingQuestion
