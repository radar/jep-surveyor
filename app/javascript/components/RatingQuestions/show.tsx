
import * as React from 'react'
import * as styles from './index.module.scss'
import RatingQuestion from './RatingQuestion'

interface Question {
  id: string,
  title: string
}

interface SingleRatingQuestionsProps {
  question: Question
}

class SingleRatingQuestion extends React.Component<SingleRatingQuestionsProps, {}> {
  

  render() {
    return(
      <div className={styles.listOfQuestions} data-automation-id='questions-list'>
      <RatingQuestion  key={this.props.question.id} {...this.props.question} />
      <a href="/">All questions</a>
      </div>
    )
  }
}

export default SingleRatingQuestion