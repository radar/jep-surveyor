import * as React from 'react'
import * as styles from './RatingQuestion.module.scss'

interface RatingQuestionProps {
  id: string,
  title: string
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  render() {
    return (
      <div >
        <a href={`/rating_questions/${this.props.id}`}>
          <div className={styles.ratingQuestion}>{this.props.title}
          </div>
        </a>
      </div>
    )
  }
}

export default RatingQuestion