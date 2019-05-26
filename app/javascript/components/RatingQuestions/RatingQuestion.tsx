import * as React from 'react'
import * as styles from './RatingQuestion.module.scss'
import { NONAME } from 'dns';

interface RatingQuestionProps {
  id: string,
  title: string,
  style: {}
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  render() {
    return (
      <div className={styles.container}>
        <div className={styles.title}>{this.props.title}</div>
      </div>
    )
  }
}

export default RatingQuestion

